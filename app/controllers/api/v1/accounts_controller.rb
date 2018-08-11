class Api::V1::AccountsController < ApplicationController
  before_action :authenticate, only: [:index, :create]
  def index
    accounts = Account.all
    token = request.headers['Authorization']
    #
    # begin
    #   decoded_token = JWT.decode token, secret_key(), true
    # rescue JWT::DecodeError => e
    #   decoded_token = nil
    # end
    #
    # if(!!decoded_token)
      render json: accounts
    # else
    #   render json: {
    #     message: 'Authorization failed.'
    #   }, status: :unauthorized
    # end
  end

  def create
    account = Account.create(account_params)
    render json: account
  end

  private

    def account_params
      params.require(:account).permit(:name, :number, :parent_id)
    end

end
