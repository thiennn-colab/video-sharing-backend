class SessionsController < ApplicationController
  def create
    user = User.find_by_email!(params[:email])

    if user.valid_password?(params[:password])
      payload = { user_id: user.id }
      @login = JWTSessions::Session.new(payload: payload, access_exp: 6.hours.to_i).login
      @email = user.email
    else
      raise Exception.new("Invalid email or password")
    end
  end
end
