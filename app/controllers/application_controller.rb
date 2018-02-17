class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception
  
  protected
 
  # Devise 설정
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :email, :password, :do_say, :manage_agree, :profile_select, :profile_icon, :profile_banner, :comment_auto_open])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname, :email, :password, :current_password, :do_say, :manage_agree, :profile_select, :profile_icon, :profile_banner, :comment_auto_open])
  end
  
  # 게시판 IP 알아내기
  def remote_ip
    if request.remote_ip == '127.0.0.1'
      # Hard coded remote address
      '123.45.67.89'
    else
      request.remote_ip
    end
  end
end
