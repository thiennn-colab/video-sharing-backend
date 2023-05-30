class SessionsController < ApplicationController
  def create
    user = User.find_by_email!(params[:email])

    if user.valid_password?(params[:password])
      payload = { user_id: user.id }
      @login = JWTSessions::Session.new(payload: payload).login
    else
      raise Exception.new("Invalid email or password")
    end
  end
end
