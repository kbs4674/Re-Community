class CommentQnasController < ApplicationController
  before_action :set_qna
  before_action :set_comment_qna, only: :destroy

  def create
    @comment_qna = @qna.comment_qnas.new(comment_qna_params)
    @comment_qna.user_name = current_user.nickname
    @comment_qna.save
    @new_notification = NewNotification.create! user: @comment_qna.user,
                                         content: "#{current_user.nickname} 님이 질문글에 답변하셨습니다.",
                                         link: "#{qna_path(@qna)}#comment_qna_#{@comment_qna.id}"
  end

  def destroy
    # 이미 삭제된 글이 또 삭제될 경우 영원히 삭제됨. (이 때, 삭제된 데이터는 로그기록에도 안남음.)
    if @comment_qna.deleted? == true
      @comment_qna.really_destroy!
    else
      # 최초로 삭제될 경우 겉으론 삭제된 것 처럼 보이나, 삭제된 데이터의 기록이 남아있음.
      @comment_qna.destroy
    end
  end
  
  def really_destroy
    @comment_qna.really_destroy!
  end
  
  # 투표관련 Controller 내용 : 찬성
  def upvote
    @comment_qna = CommentQna.find(params[:comment_qna_id])

    if ((current_user.voted_up_on? @comment_qna) == true)
      @comment_qna.unliked_by current_user
    elsif ((current_user.voted_down_on? @comment_qna) == true)
      @comment_qna.unliked_by current_user
    else 
      @comment_qna.upvote_by current_user
    end
    
    redirect_back(fallback_location: root_path)
  end

  # 투표 관련 Controller 내용 : 반대
  def downvote
    @comment_qna = CommentQna.find(params[:comment_qna_id])
    
    if ((current_user.voted_down_on? @comment_qna) == true)
      @comment_qna.undisliked_by current_user
    elsif ((current_user.voted_up_on? @comment_qna) == true)
      @comment_qna.undisliked_by current_user
    else
      @comment_qna.downvote_from current_user
    end

    redirect_back(fallback_location: root_path)
  end

  private

  def set_qna
    @qna = Qna.find(params[:qna_id])
  end

  def set_comment_qna
    @comment_qna = @qna.comment_qnas.with_deleted.find(params[:id])
  end

  def comment_qna_params
    params[:comment_qna][:user_id] = current_user.id
    params.require(:comment_qna).permit(:body, :user_id)
  end
end