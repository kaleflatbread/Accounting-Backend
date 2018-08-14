class Api::V1::AccountsController < ApplicationController
  before_action :authenticate, only: [:index, :create]
  def index
    accounts = Account.all
    render json: accounts
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
