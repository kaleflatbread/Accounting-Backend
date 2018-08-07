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
      params.require(:transaction).permit(:account_id, :user_id, :memo, :je_num, :date)
    end

end
:amount
t.integer :account_id
t.integer :user_id
t.string :memo
t.integer :je_num
t.string :vendor
t.date :date
