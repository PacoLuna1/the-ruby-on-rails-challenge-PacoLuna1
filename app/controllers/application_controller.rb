# frozen_string_literal: true

# Application controller
class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: %i[name description email password avatar])
    devise_parameter_sanitizer.permit(:sign_in,
                                      keys: %i[name description email password avatar])
    devise_parameter_sanitizer.permit(:account_update,
                                      keys: %i[name description email password current_password avatar])
  end
end
