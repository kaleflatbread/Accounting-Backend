class Api::V1::TransactionsController < ApplicationController



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
      params.require(:transaction).permit(:account_id, :type, :transaction_type, :user_id, :memo, :je_num, :date, :quantity_change, :amount, :cost_per_unit, :sku)
    end

end
