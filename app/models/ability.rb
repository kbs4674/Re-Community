class Ability
  include CanCan::Ability

    def initialize(user)
      #user -> current_user 
      user ||= User.new # guest user (not logged in)
      if user.has_role? (:admin) #어드민 권한
        can :manage, :all #create, edit 등
      elsif user.has_role? (:block_yellow)
        cannot [:index, :show, :new, :create], Bulletin
        cannot [:create, :new], Post
        cannot [:create, :new], Qna
        cannot [:new, :create, :destroy], Comment, user_id: user.id
        cannot [:create, :destroy], CommentQna, user_id: user.id
        can [:index, :show], Post
        can [:index, :show], Qna
        can [:index, :show], AllNotice
        can [:show], User, id: user.id
      elsif user.has_role? (:block_red)
        cannot [:index, :show, :new, :create], Bulletin
        cannot [:index, :show, :new, :create], Post
        cannot [:index, :show, :new, :create], Qna
        cannot [:new, :create, :destroy], Comment, user_id: user.id
        cannot [:create, :destroy], CommentQna, user_id: user.id
        can [:index, :show], AllNotice
        can [:show], User, id: user.id
      elsif user.has_role? (:student) 
        #일반 회원 권한 : 비허용
        #cannot [:index, :show, :new, :create], Post
               
        #일반 회원 권한 : 허용
        cannot [:index, :show, :new, :create], Bulletin
        cannot [:create, :new], AllNotice
        can [:index, :show], AllNotice
        
        can [:index, :show, :create, :new], Post
        can [:edit, :update, :destroy], Post, user_id: user.id
        can [:upvote, :downvote], Post
        
        can [:new, :create, :destroy], Comment, user_id: user.id
        can [:new, :create, :destroy], CommentQna, user_id: user.id
        
        can [:show], User, id: user.id
      else
        cannot [:index, :show, :new, :create], Bulletin
        cannot [:create, :new], AllNotice
        can [:index, :show], AllNotice
        can [:index], Post
      end
    end
end