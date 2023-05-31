class UsersController < ApplicationController
  def create
    user = User.create!(email: params[:email], password: params[:password])
    @login = JWTSessions::Session.new(payload: { user_id: user.id }).login
    @email = user.email
  end
end
