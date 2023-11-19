class TokensController < ApplicationController
  skip_before_action :authenticate_token!, only: [:index]

  def index
      token = Token.create
      render json: { token: token.authentication_token }, status: :ok
  end

end
