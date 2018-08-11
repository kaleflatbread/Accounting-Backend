class SessionsController < ApplicationController

  def create
    @user = User.find_by(email: params["email"])

    if (@user && @user.authenticate(params["password"]))
    

      token = JWT.encode payload, secret_key(), "HS256"
      render json: {
        email: @user.email,
        id: @user.id,
        token: gen_token()
      }
    else
      render json: {
        errors: "Username or password incorrect"
      }, status: :unauthorized
    end
  end

end
