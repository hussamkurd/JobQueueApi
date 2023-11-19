class ApplicationController < ActionController::API
  before_action :authenticate_token!

  private

  def authenticate_token!
    token = request.headers['Authorization']
    @current_token = Token.find_by(authentication_token: token)

    unless @current_token
      render json: { error: 'Unauthorized' }, status: :unauthorized
    end
  end

end
