class UsersController < ApplicationController
  def create
    user = User.create!(email: params[:email], password: params[:password])
    payload = { user_id: user.id }
    @login = JWTSessions::Session.new(payload: payload).login
  end
end
