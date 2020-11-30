class Api::V1::DebtsController < ApplicationController
  before_action :set_debt, only: [:update, :destroy]

  def index
    user = User.find_by(id: params['user_id'])
		debts = user.debts.all
		render json: debts
	end

  # POST /debts
  def create
    user = User.find_by(id: debt_params['user_id'])
		debt = user.debts.build(debt_params)
    if debt.save
      user_debts = user.debts.all
      render json: user_debts
    else
      render json: debt.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /debts/1
  def update
    if @debt.update(debt_params)
      user = User.find_by(id: debt_params['user_id'])
      user_debts = user.debts.all
      binding.pry
      render json: user_debts
    else
      render json: @debt.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @debt.destroy
  end

  private
    def set_debt
      @debt = Debt.find(debt_params[:id])
    end

    def debt_params
      params.require(:debt).permit(:id, :title, :total, :is_paid, :user_id)
    end
end
