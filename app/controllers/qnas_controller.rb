class QnasController < ApplicationController
  # 로그인 된 사용자만 접근 가능
  before_action :authenticate_user!
  before_action :set_qna, only: [:show, :edit, :update, :destroy]
  # 권한설정
  load_and_authorize_resource
  before_action :log_impression, :only=> [:show]
 
  # 조회수
  def log_impression
    if current_user.has_role? :admin
      @hit_post = Qna.with_deleted.find(params[:id])
    else
      @hit_post = Qna.find(params[:id])
    end
    # this assumes you have a current_user method in your authentication system
    @hit_post.impressions.create(ip_address: request.remote_ip,user_id:current_user.id)
  end
  
  def upvote
    @qna = Qna.find(params[:qna_id])
 
    #만약 '찬성' 투표를 이미 한 경우 : '찬성' 투표 취소
    if ((current_user.voted_up_on? @qna) == true)
      @qna.unliked_by current_user
      redirect_to(request.referrer, :notice => '해당 글의 추천을 취소하셨습니다.')
    else
      @qna.upvote_by current_user
      redirect_to(request.referrer, :notice => '해당 글을 추천하셨습니다.')
    end
  end
 
  # 투표 관련 Controller 내용 : 반대
  def downvote
    @qna = Qna.find(params[:qna_id])
      
    #만약 '반대' 투표를 이미 한 경우 : '반대' 투표 취소
    if ((current_user.voted_down_on? @qna) == true)
      @qna.undisliked_by current_user
      redirect_to(request.referrer, :notice => '해당 글의 반대를 취소하셨습니다.')
    else
      @qna.downvote_from current_user
      redirect_to(request.referrer, :notice => '해당 글을 반대하셨습니다.')
    end
  end
  
  # GET /qnas
  # GET /qnas.json
  def index
    @all_notices = AllNotice.all
    @qnas = Qna.order("created_at DESC").page(params[:page]).per(5)
    @qna_likes = Qna.order(:cached_votes_up => :desc)
  end

  # GET /qnas/1
  # GET /qnas/1.json
  def show
    @qnas = Qna.order("created_at DESC").page(params[:page]).per(5)
    @all_notices = AllNotice.all
    
    #댓글
    @comment_qnas = @qna.comment_qnas.page params[:page]
    #@qna          = Qna.find(params[:id])
    #@new_comment  = Comment.build_from(@qna, current_user.id, "")
  end

  # GET /qnas/new
  def new
    @qna = Qna.new
  end

  # GET /qnas/1/edit
  def edit
  end

  # POST /qnas
  # POST /qnas.json
  def create
    @qna = Qna.new(qna_params)
    #@qna.num = 3 # 게시글 블라인드 경고 limit
    @qna.user_name = current_user.nickname

    respond_to do |format|
      if @qna.save
        format.html { redirect_to @qna, notice: '게시글이 성공적으로 작성되었습니다.' }
        format.json { render :show, status: :created, location: @qna }
      else
        format.html { render :new }
        format.json { render json: @qna.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /qnas/1
  # PATCH/PUT /qnas/1.json
  def update
    respond_to do |format|
      if @qna.update(qna_params)
        format.html { redirect_to @qna, notice: '게시글이 성공적으로 수정되었습니다.' }
        format.json { render :show, status: :ok, location: @qna }
      else
        format.html { render :edit }
        format.json { render json: @qna.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /qnas/1
  # DELETE /qnas/1.json
  def destroy
    if @qna.deleted? == true
      @qna.really_destroy!
    else
      @qna.destroy
    end
    respond_to do |format|
      format.html { redirect_to qnas_url, notice: '게시글이 성공적으로 제거되었습니다.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_qna
      if current_user.has_role? :admin
        @qna = Qna.with_deleted.find(params[:id])
      else
        @qna = Qna.find(params[:id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def qna_params
      params[:qna][:user_id] = current_user.id
      params.require(:qna).permit(:title, :content, :user_id, :num, :notice)
    end
end