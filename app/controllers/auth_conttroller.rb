class AuthController < ApplicationController
  def create
    email = params[:email]
    password = params[:password]

    user = User.find_by(email: email)

    if user && (user.password == password)
      # Create Session
    else
      head :unauthorized
    end
  end
end
