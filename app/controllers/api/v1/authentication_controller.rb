class Api::V1::AuthenticationController < ApiController
  before_action :authenticate_user!, only: [:destroy]

  def create
    user = User.find_by(email: params[:user][:email])
    user.valid_password?(params[:user][:password]) ?
    render(json: {user: user, token: JsonWebToken.encode(sub: user.id)}) :
    render(json: {errors: ["Invalid email or password"]}, status: :unauthorized)
  end

  def destroy
    head(:ok)
  end
end
