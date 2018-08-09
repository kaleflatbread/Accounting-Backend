class SessionsController < ApplicationController

  def create
    @user = User.find_by(id: params["id"])

    if (@user && @user.authenticate(params["password"]))
      render json: {
        email: @user.email,
        first_name: @user.first_name
        id: @user.id,
        token: gen_token()
      }
    else
      render json: {
        errors: "Username or password incorrect"
      }, status: :unauthorized
    end
  end


  def destroy
    session.delete :id
  end
end
