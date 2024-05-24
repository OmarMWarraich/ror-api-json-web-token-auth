class Api::V1::AuthenticationController < ApiController

  def create
    user = User.find_by(email: params[:user][:email])
    user.valid_password?(params[:user][:password]) ?
    render(json: {token: JsonWebToken.encode(sub: user.id)}) :
    render(json: {errors: ["Invalid email or password"]}, status: :unauthorized)
  end
end
