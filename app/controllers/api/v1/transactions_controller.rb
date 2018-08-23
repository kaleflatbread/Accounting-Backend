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

  def show
   @transaction = Transaction.find(params[:id])
   render json: @json
 end


  def update
    @transaction = Transaction.find_by(id: params[:id])

    # @transaction.transaction_title = params[:transaction_title]
    # @transaction.description = params[:description]
    # @transaction.transaction_date = params[:transaction_date]
    # @transaction.start_time = params[:start_time]
    # @transaction.end_time = params[:end_time]
    # @transaction.user_id = params[:user_id]
    if (@transaction.save)
      render json: @transaction
    else
      render json: {
        errors: @transaction.errors.full_messages
      }, status: :unprocessable_entity
    end
  end

  def delete
    @transaction = Transaction.find(params[:id])
    @transaction.destroy
    render json: Transaction.all
  end


  private

    def transaction_params
      params.require(:transaction).permit(:account_id, :child_type, :user_id, :memo, :date, :quantity_change, :amount, :cost_per_unit, :sku)
    end

end
