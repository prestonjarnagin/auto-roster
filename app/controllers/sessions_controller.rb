# frozen_string_literal: true

class SessionsController < Devise::SessionsController
  def create
    user = User.find_by(email: sign_in_params[:email])

    if user&.valid_password?(sign_in_params[:password])
      render json: { jwt: user.generate_jwt }, status: :ok
    else
      head :unauthorized
    end
  end
end
