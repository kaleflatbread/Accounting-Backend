class Api::V1::TransactionsController < ApplicationController
  before_action :authenticate, only: [:index, :create]

  def index
    transactions = Transaction.all
    # token = request.headers['Authorization']
    #
    # begin
    #   decoded_token = JWT.decode token, secret_key(), true
    # rescue JWT::DecodeError => e
    #   decoded_token = nil
    # end
    #
    # if(!!decoded_token)
      render json: transactions
    # else
    #   render json: {
    #     message: 'Authorization failed.'
    #   }, status: :unauthorized
    # end
  end

  def create
    byebug
    transaction = Transaction.create(transaction_params)
    render json: transaction
  end


  private

    def transaction_params
      params.require(:transaction).permit(:account_id, :transaction_type, :user_id, :memo, :date, :quantity_change, :amount, :cost_per_unit, :sku)
    end

end
