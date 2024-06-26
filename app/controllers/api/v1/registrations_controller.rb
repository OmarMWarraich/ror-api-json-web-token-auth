class Api::V1::RegistrationsController < ApiController
  def create
        user = User.new(user_params)
        if user.save
          render json: { status: 'User created successfully', token: JsonWebToken.encode(sub: user.id) }, status: :created
        else
          render json: { errors: user.errors.full_messages }, status: :bad_request
        end
      end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
