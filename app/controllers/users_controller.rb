class UsersController < ApplicationController
  def create
    raise Exception.new("Confirm Password must be the same with password") unless params[:password] == params[:confirmPassword]
    user = User.create!(email: params[:email], password: params[:password])
    @login = JWTSessions::Session.new(payload: { user_id: user.id }, access_exp: 6.hours.to_i).login
    @email = user.email
  end
end
