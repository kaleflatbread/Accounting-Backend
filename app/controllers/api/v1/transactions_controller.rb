class Api::V1::TransactionsController < ApplicationController
  before_action :authenticate, only: [:index, :create]

  def index
    transactions = Transaction.all
    render json: transactions
  end

  def create
    transaction = Transaction.create(transaction_params)
    render json: transaction
  end


  private

    def transaction_params
      params.require(:transaction).permit(:account_id, :child_type, :user_id, :memo, :date, :quantity_change, :amount, :cost_per_unit, :sku)
    end

end
