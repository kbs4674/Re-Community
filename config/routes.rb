Rails.application.routes.draw do
  root "homes#index"

  resources :all_notices
  
  #알림 : 전체 삭제
  get '/new_notifications/read_all' => 'new_notifications#read_all'
  #알림
  resources :new_notifications
  
  resources :qnas do
    post "/report_qna", to: "report_qnas#report_qna_toggle"
    put "/like", to:    "qnas#upvote"
    put "/dislike", to: "qnas#downvote"

    resources :comment_qnas do
      put "/like", to:    "comment_qnas#upvote"
      put "/dislike", to: "comment_qnas#downvote"
    end
  end
  
  resources :searches
  resources :search_all_notices
  resources :search_qnas
  
  resources :bulletins do
    resources :posts do
      put "/like", to:    "posts#upvote"
      put "/dislike", to: "posts#downvote"
      collection do
        get :search
      end
    end
  end
  
  resources :comments do
    put "/like", to:    "comments#upvote"
    put "/dislike", to: "comments#downvote"
    post "/report_comment", to: "report_comments#report_comment_toggle"
    post "/comment_destroys", to: "comment_destroys#comment_destroy_toggle"
  end
  
  resources :bulletins do
    resources :posts
    post "/posts/:post_id/report", to: "reports#report_toggle"
  end
  
  devise_for :users, :controllers => { omniauth_callbacks: 'users/omniauth_callbacks' }
  
  #devise_for :users로 인해 별도의 라우터 설정 필요 171012 상열
  resources :users, :only => [:show]
  
  #이미지 업로드 (AWS S3 연동)
  post '/tinymce_assets' => 'tinymce_assets#create'
  
  devise_for :admins
  # 어드민 페이지 및 rails_db
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
end
