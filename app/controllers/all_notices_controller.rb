class AllNoticesController < ApplicationController
  #before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_all_notice, only: [:show, :edit, :update, :destroy]
  impressionist actions: [:show], unique: [:session_hash]
  #before_action :log_impression, :only=> [:show]
 
  #def log_impression
  #  @hit_post = AllNotice.find(params[:id])
    # this assumes you have a current_user method in your authentication system
  #  @hit_post.impressions.create(ip_address: request.remote_ip,user_id:current_user.id)
  #end

  # GET /all_notices
  # GET /all_notices.json
  def index
    @all_notices = AllNotice.order("created_at DESC").page(params[:page]).per(10)
  end

  # GET /all_notices/1
  # GET /all_notices/1.json
  def show
    @all_notices = AllNotice.order("created_at DESC").page(params[:page]).per(10)
    
    # 댓글
    @all_notice = AllNotice.find(params[:id])
    if user_signed_in?
      @new_comment  = Comment.build_from(@all_notice, current_user.id, "")
    end
  end

  # GET /all_notices/new
  def new
    @all_notice = AllNotice.new
  end

  # GET /all_notices/1/edit
  def edit
  end

  # POST /all_notices
  # POST /all_notices.json
  def create
    @all_notice = AllNotice.new(all_notice_params)
    @all_notice.user_name = current_user.nickname

    respond_to do |format|
      if @all_notice.save
        format.html { redirect_to @all_notice, notice: '게시글이 성공적으로 작성되었습니다.' }
        format.json { render :show, status: :created, location: @all_notice }
      else
        format.html { render :new }
        format.json { render json: @all_notice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /all_notices/1
  # PATCH/PUT /all_notices/1.json
  def update
    respond_to do |format|
      if @all_notice.update(all_notice_params)
        format.html { redirect_to @all_notice, notice: '게시글이 성공적으로 수정되었습니다.' }
        format.json { render :show, status: :ok, location: @all_notice }
      else
        format.html { render :edit }
        format.json { render json: @all_notice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /all_notices/1
  # DELETE /all_notices/1.json
  def destroy
    @all_notice.really_destroy!
    respond_to do |format|
      format.html { redirect_to all_notices_url, notice: '게시글이 성공적으로 삭제되었습니다.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_all_notice
      if user_signed_in?
        if current_user.has_role? :admin
          @all_notice = AllNotice.with_deleted.find(params[:id])
        else
          @all_notice = AllNotice.find(params[:id])
        end
      else
        @all_notice = AllNotice.find(params[:id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def all_notice_params
      params[:all_notice][:user_id] = current_user.id
      params.require(:all_notice).permit(:title, :content, :user_id, :notice, :all_notice, :comment_permission, :title_tag_permission, :user_name)
    end
end
