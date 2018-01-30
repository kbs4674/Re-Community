RailsAdmin.config do |config|

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
