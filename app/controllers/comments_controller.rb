class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment

  def create
    commentable = commentable_type.constantize.find(commentable_id)
    @comment = Comment.build_from(commentable, current_user.id, body)
    @comment.user_name = current_user.nickname
    @comment.remote_ip = remote_ip()
    @comment.nickname = nickname
    @comment.num = 10 # 블라인드 처리 Limit
    if commentable_type == "Post" #Post 모델에서만 Bulletin ID가 기록되게 함.
      @comment.bulletin = commentable.bulletin_id
    end
    if not commentable_type == "AllNotice" #공지사항 게시판에는 알림이 안뜨게
      @new_notification = NewNotification.create! user: commentable.user,
                                           content: "#{current_user.nickname} 님이 댓글을 달았습니다.",
                                           link: request.referrer
    end

    respond_to do |format|
      if @comment.save
        make_child_comment
        format.html  { redirect_to("#{request.referrer}#comment#{@comment.id}", :notice => '댓글이 작성되었습니다.') }
      else
        format.html  { redirect_to(request.referrer, :alert => '댓글 내용을 작성해주세요.') }
      end
    end
  end
  
  def destroy
    @comment = Comment.find_by(id: params[:id])
    # DB 기록에서도 조차 영구 삭제
    @comment.really_destroy!
    respond_to do |format|
      format.html { redirect_to(request.referrer, :notice => '댓글이 삭제되었습니다.')}
      format.js
    end
  end
  
  # 투표 관련 Controller 내용 : 찬성
  def upvote
  @comment = Comment.find(params[:comment_id])
 
  if ((current_user.voted_up_on? @comment) == true)
    @comment.unliked_by current_user
  elsif ((current_user.voted_down_on? @comment) == true)
    @comment.unliked_by current_user
  else 
    @comment.upvote_by current_user
  end
    
    redirect_back(fallback_location: root_path)
  end
   
  # 투표 관련 Controller 내용 : 반대
  def downvote
    @comment = Comment.find(params[:comment_id])
   
    if ((current_user.voted_down_on? @comment) == true)
      @comment.undisliked_by current_user
    elsif ((current_user.voted_up_on? @comment) == true)
      @comment.undisliked_by current_user
    else
      @comment.downvote_from current_user
    end
   
  redirect_back(fallback_location: root_path)
  end
  
  private
  
  def set_comment
    @comment = Comment.find_by(id: params[:id])
  end

  def comment_params
    params[:comment][:user_id] = current_user.id
    params.require(:comment).permit(:body, :commentable_id, :commentable_type, :comment_id, :user_id, :user_name, :remote_ip, :num, :nickname, :bulletin)
  end

  def commentable_type
    comment_params[:commentable_type]
  end

  def commentable_id
    comment_params[:commentable_id]
  end

  def comment_id
    comment_params[:comment_id]
  end

  def body
    comment_params[:body]
  end
  
  def nickname
    comment_params[:nickname]
  end
  
  def bulletin
    comment_params[:bulletin]
  end
  
  def make_child_comment
    return "" if comment_id.blank?

    parent_comment = Comment.find comment_id
    @comment.move_to_child_of(parent_comment)
  end
end