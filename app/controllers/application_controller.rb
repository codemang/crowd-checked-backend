class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def authenticate_extension_user
    authenticate_with_http_token do |api_token, options|
      @extension_user = User.find_by(api_token: api_token)
    end
    head :unauthorized if @extension_user.nil?
  end

  def current_extension_user
    @extension_user
  end
end
