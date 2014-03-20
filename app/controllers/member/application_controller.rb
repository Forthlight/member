module Member
  class ApplicationController < ActionController::Base
    before_filter :configure_permitted_parameters, if: :devise_controller?


    protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :first_name, :last_name, :role) }
    end
  end
end
