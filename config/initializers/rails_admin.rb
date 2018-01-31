RailsAdmin.config do |config|

  ## Model 이름을 한국어로 변경
  config.model 'Post' do
	    label '(일반/특수)게시판'
	    label_plural '(일반/특수)게시판'
	    #navigation_icon 'icon-list-alt'
    end

    config.model 'Qna' do
	    label '질문답변 게시판'
	    label_plural '질문답변 게시판'
	end

	config.model 'AllNotice' do
	    label '공지사항 게시판'
	    label_plural '공지사항 게시판'
	end
	
	config.model 'Bulletin' do
	    label '카테고리 목록'
	    label_plural '카테고리 목록'
	end
	
	## 특정 링크 삽입
	config.navigation_static_links = {
	  '카테고리 설정' => "/bulletins",
	  'Google Search Consol' => "https://www.google.com/webmasters/tools/home?hl=ko"
	}

  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
   warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)
  
  config.authorize_with do |controller|
    if current_user.nil?
      redirect_to main_app.new_account_session_path, flash: {error: '로그인 먼저 해주세요.'}
    elsif !current_user.admin?
      redirect_to main_app.root_path, flash: {error: '당신은 Admin이 아닙니다!'}
    end
  end

  ## == devise의 :lockable 충돌 문제 해결 코드 ==
  config.model 'User' do |t|
    t.exclude_fields :unlock_token
    t.exclude_fields :confirmation_token
  end

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
