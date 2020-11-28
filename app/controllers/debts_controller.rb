class DebtsController < ApplicationController
  before_action :set_debt, only: [:show, :update, :destroy]

  # GET /debts
  def index
    @debts = Debt.all

    render json: @debts
  end

  # GET /debts/1
  def show
    render json: @debt
  end

  # POST /debts
  def create
    @debt = Debt.new(debt_params)

    if @debt.save
      render json: @debt, status: :created, location: @debt
    else
      render json: @debt.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /debts/1
  def update
    if @debt.update(debt_params)
      render json: @debt
    else
      render json: @debt.errors, status: :unprocessable_entity
    end
  end

  # DELETE /debts/1
  def destroy
    @debt.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_debt
      @debt = Debt.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def debt_params
      params.require(:debt).permit(:title, :total, :is_paid, :user_id, :expense_id)
    end
end
