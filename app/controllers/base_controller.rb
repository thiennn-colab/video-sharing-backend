class BaseController < ApplicationController
  include JWTSessions::RailsAuthorization
  before_action :authorize_access_request!, :authenticate_user!

  rescue_from JWTSessions::Errors::Unauthorized, with: :not_authorized

  def authenticate_user!
    head :unauthorized unless current_user
  end

  def current_user
    @current_user ||= User.find(payload["user_id"])
  end

  private

  def not_authorized
    render json: { error: "Not authorized" }, status: :unauthorized
  end
end
