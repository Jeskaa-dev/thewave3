class ApplicationController < ActionController::Base
  before_action :authenticate_user!, unless: :omniauth_request?
  include Pundit::Authorization

  # Pundit: allow-list approach
  # after_action :verify_authorized, unless: :skip_pundit?
  # after_action :verify_policy_scoped, unless: :skip_pundit?

  # Uncomment when you *really understand* Pundit!
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  # def user_not_authorized
  #   flash[:alert] = "You are not authorized to perform this action."
  #   redirect_to(root_path)
  # end

  private

  def skip_pundit?
    Rails.logger.debug "Skip Pundit for controller: #{params[:controller]}"
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)|(^users\/omniauth_callbacks$)/
  end

  def omniauth_request?
    Rails.logger.debug "OmniAuth request for controller: #{params[:controller]}"
    params[:controller] =~ /omniauth/ || params[:controller] =~ /pages/
  end
end
