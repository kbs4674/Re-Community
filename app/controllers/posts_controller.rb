class PostsController < ApplicationController
  # 로그인 된 사용자만 접근 가능
  before_action :authenticate_user!, only: [:index, :new, :show, :edit]
  #skip_before_action :authenticate_user!, only: [:index]
  
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :log_impression, :only=> [:show]
  before_action :set_bulletin
  # 권한설정
  load_and_authorize_resource
  
  # 조회수 기록
  def log_impression
    if current_user.has_role? :admin
      @hit_post = Post.with_deleted.find(params[:id])
    else
      @hit_post = Post.find(params[:id])
    end
    # this assumes you have a current_user method in your authentication system
    @hit_post.impressions.create(ip_address: request.remote_ip,user_id:current_user.id)
  end
  
  def upvote
  @post = Post.find(params[:post_id])
 
    #만약 '찬성' 투표를 이미 한 경우 : '찬성' 투표 취소
    if ((current_user.voted_up_on? @post) == true)
      @post.unliked_by current_user
      redirect_to(request.referrer, :notice => '해당 글의 추천을 취소하셨습니다.')
    else
      @post.upvote_by current_user
      redirect_to(request.referrer, :notice => '해당 글을 추천하셨습니다.')
    end
  end
 
  # 투표 관련 Controller 내용 : 반대
  def downvote
    @post = Post.find(params[:post_id])
      
    #만약 '반대' 투표를 이미 한 경우 : '반대' 투표 취소
    if ((current_user.voted_down_on? @post) == true)
      @post.undisliked_by current_user
      redirect_to(request.referrer, :notice => '해당 글의 반대를 취소하셨습니다.')
    else
      @post.downvote_from current_user
      redirect_to(request.referrer, :notice => '해당 글을 반대하셨습니다.')
    end
  end


  def index
    @bulletins = Bulletin.all
    @bulletin = Bulletin.find(params[:bulletin_id])
    @all_notices = AllNotice.all

    if (@bulletin.info_room_trade == true || @bulletin.info_trade == true)
      @posts = Post.where(bulletin_id: @bulletin).order("created_at DESC").page(params[:page]).per(6)
    else
      @posts = Post.where(bulletin_id: @bulletin).order("created_at DESC").page(params[:page]).per(10)
    end
    
    @post_likes = Post.where(bulletin_id: @bulletin).order(:cached_votes_up => :desc)
  end

  def show
    @comment_qnas = @post.comment_qnas.page params[:page]
    
    @bulletin = Bulletin.find(params[:bulletin_id])
    @all_notices = AllNotice.all
    @posts = Post.where(bulletin_id: @bulletin).order("created_at DESC").page(params[:page]).per(5)
    
    # 대댓글
    if current_user.has_role? :admin
      @post         = Post.with_deleted.find(params[:id])
    else
      @post         = Post.find(params[:id])
    end
    @new_comment  = Comment.build_from(@post, current_user.id, "")
  end

  def new
    @bulletin = Bulletin.find(params[:bulletin_id])
    @post = @bulletin.present? ? @bulletin.posts.new : Post.new
  end

  def edit
    @bulletin = Bulletin.find(params[:bulletin_id])
  end

  def create
    @bulletin = Bulletin.find(params[:bulletin_id])
    @post = @bulletin.present? ? @bulletin.posts.new(post_params) : Post.new(post_params)
    # @post.num = 3 # 게시글 블라인드 경고 limit
    @post.remote_ip = remote_ip()
    @post.user_name = current_user.nickname
    
    respond_to do |format|
      if @post.save
        format.html { redirect_to (@bulletin.present? ? [@post.bulletin, @post] : @post), notice: '게시글이 성공적으로 작성되었습니다.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to (@bulletin.present? ? [@post.bulletin, @post] : @post), notice: '게시글이 성공적으로 수정되었습니다.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if @post.deleted? == true
      @post.really_destroy!
    else
      @post.destroy
    end
    respond_to do |format|
      format.html { redirect_to (@bulletin.present? ? bulletin_posts_url : posts_url), notice: '게시글이 성공적으로 제거되었습니다.' }
      format.json { head :no_content }
    end
  end

  private
  def set_bulletin
    @bulletin = Bulletin.find(params[:bulletin_id]) if params[:bulletin_id].present?
  end

  def set_post
    if @bulletin.present?
      @post = @bulletin.posts.find(params[:id])
    else
      if current_user.has_role? :admin
        @post = Post.with_deleted.find(params[:id])
      else
        @post = Post.find(params[:id])
      end
    end
  end

  def post_params
    params[:post][:user_id] = current_user.id
    params.require(:post).permit(:title, :content, :user_id, :num, :notice, :location, :phone_num, :etc, :skill, :time, :agree, :price_job, :nickname, :room_select, :deposit, :scale, :price_room, :contract_day, :sns, :vender, :trade_way, :price, :remote_ip, :person, :short_talk, :image, :group_name) 
  end
end