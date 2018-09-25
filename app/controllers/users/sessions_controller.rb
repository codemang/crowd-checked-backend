# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  skip_before_action :verify_authenticity_token, only: [:extension_login]

  def extension_login
    user = User.find_by(email: params[:user][:email])
    if user && user.valid_password?(params[:user][:password])
      render json: {token: user.api_token}
    else
      head :unauthorized
    end
  end
end
