class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :authenticate_user!

  layout :layout_by_resources



  def layout_by_resources
    user_signed_in? ? "application" : "my_devise"
  end
  
  def after_sign_out_path_for(resource)
    # Customize the redirect path after logout
    new_user_session_path
  end
  
  def after_sign_in_path_for(resource)
    root_path
  end
  
  protected
  
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit :sign_up,keys: [:username]

      # added_attrs = [:user_name, :email,:username, :password_confirmation, :remember_me]
      # devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
      # devise_parameter_sanitizer.permit :sign_up, keys: [:login, :password]
      # devise_parameter_sanitizer.permit :account_update, keys: added_attrs
      # devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end
end





















