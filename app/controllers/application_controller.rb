class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :organization_id])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

  def current_organization
    current_user&.organization
  end

  helper_method :current_organization

  # Redireciona para a home após logout
  def after_sign_out_path_for(resource_or_scope)
    root_path
  end
end