class SessionsController < ActionController::API
  def create
    user = User.find_by_email!(params.require(:email))

    if user.valid_password?(params.require(:password))
      payload = { user_id: user.id }
      @login = JWTSessions::Session.new(payload: payload).login
    else
      head :unauthorized
    end
  end
end
