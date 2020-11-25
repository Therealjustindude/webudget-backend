class Api::V1::ExpensesController < ApplicationController
	before_action :set_expense, only: [:update, :destroy]

	def create
		user = User.find_by(id: expense_params['user_id'])
		expense = user.expenses.build(expense_params)
		if expense.save 
			render json: expense.serializable_hash(only: [:id, :user_id, :description, :amount, :date_due, :bank_account, :is_automatic, :is_paid, :is_money_in_account])
		else
			render json: expense.errors, status: :unprocessable_entity
		end
		
	end

	def update
		if @expense.update_attributes(expense_params)
			render json: @expense.serializable_hash(only: [:id, :user_id, :description, :amount, :date_due, :bank_account, :is_automatic, :is_paid, :is_money_in_account])
		  else
			render json: @expense.errors, status: :unprocessable_entity
		  end
	end

	def destroy
		@expense.destroy
	end


	private
	def set_expense
		@expense = Expense.find(expense_params[:id])
	end
	
	def expense_params
		params.require(:expense).permit(:id, :user_id, :description, :amount, :date_due, :bank_account, :is_automatic, :is_paid, :is_money_in_account)
	end
end
