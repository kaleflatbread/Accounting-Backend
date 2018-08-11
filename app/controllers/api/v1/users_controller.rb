class Api::V1::UsersController < ApplicationController
  before_action :authenticate, only: [:index, :create]
  def index
    # token = request.headers['Authorization']
    users = User.all

    # begin
    #   decoded_token = JWT.decode token, secret_key(), true
    # rescue JWT::DecodeError => e
    #   decoded_token = nil
    # end

    # if(!!decoded_token)
      render json: users
    # else
    #   render json: {
    #     message: 'Authorization failed.'
    #   }, status: :unauthorized
    # end

  end

  def create
    @user = User.new

    @user.username = params[:email]
    @user.password = params[:password]

    if (@user.save)


      token = JWT.encode payload, secret_key(), "HS256"
      render json: {
        email: @user.email,
        id: @user.id,
        token: gen_token()
      }
    else
      render json: {
        errors: @user.errors.full_messages
      }, status: :unprocessable_entity
    end
  end

  def currentuser
    @user = User.find_by(id: get_token_payload('sub'))

    if (!!@user)
      render json: @user
    else
      render json: {
        message: 'Invalid token.'
      }, status: :unauthorized
    end
  end


  private

    def user_params
      params.require(:user).permit(:email, :first_name, :last_name, :role, :password)
    end


end
