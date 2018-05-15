class UsersController < ApplicationController
    # 로그인 된 사용자만 접근 가능
    before_action :authenticate_user!
    
    def message
        session[:conversations] ||= []
        @users = User.all.where.not(id: current_user)
        @conversations = Conversation.includes(:recipient, :messages)
                                     .find(session[:conversations])
        @message_list = Message.all
    end
    
    def show
        @user = User.find(params[:id])
        # 권한을 가진 자만 접근가능! / 해당 def만 rolife+cancancan 적용.
        authorize! :show, @user
        
        @bulletins = Bulletin.all
        @posts = Post.all
        
        @comements = Comment.all
        @comement_qnas = CommentQna.all
        
        # Json 연동
        respond_to do |format|
          format.html
          format.json { render json: @user }
        end
    end
    
    def user_list
        @users = User.all
        
        # Json 연동
        respond_to do |format|
          format.html
          format.json { render json: @users }
        end
    end
    
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :role)
    end
    
end
