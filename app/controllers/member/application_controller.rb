module Member
  class ApplicationController < ActionController::Base
    before_filter :authenticate_user!
    before_filter :configure_permitted_parameters, if: :devise_controller?

    protected

    # Adding custom fields to devise
    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :username, :first_name, :last_name, :role, :remember_me) }
      devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, :email, :password, :remember_me) }
      devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password) }
    end

    def after_sign_out_path_for(user) 
      main_app.root_path
    end
  end
end
