class UsersController < ApplicationController
  def create
    user = User.create!(email: params[:email], password: "123")
    @login = JWTSessions::Session.new(payload: { user_id: user.id }).login
  end
end
