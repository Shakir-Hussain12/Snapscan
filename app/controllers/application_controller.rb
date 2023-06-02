class ApplicationController < ActionController::Base
    protect_from_forgery
  
    include Devise::Controllers::Helpers
    before_action :allowed_parameters, if: :devise_controller?
    before_action :authenticate_user!
  
    protected
  
    def allowed_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: %i[name email password])
      devise_parameter_sanitizer.permit(:account_update, keys: %i[name email password current_password])
    end

    def authenticate_user!
      redirect_to home_path unless User.any? || within_authenticate_user?
    end

    private

    def within_authenticate_user?
      caller.any? { |call| call.include?('authenticate_user!') }
    end
  end
  