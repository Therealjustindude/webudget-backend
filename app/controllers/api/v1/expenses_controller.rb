class Api::V1::ExpensesController < ApplicationController
	before_action :set_expense, only: [:show, :update, :destroy]

	def index	
		@expenses = Expense.all
		render json: @expenses
	end

	def show
		render json: @expense 
	end

	def create
		user = User.find_by(id: expense_params['user_id'])
		expense = user.expenses.build(expense_params)
		#add logic to make sure user is logged in and able to create this expense
		if expense.save 
			render json: expense.serializable_hash(only: [:id, :user_id, :description, :amount, :date_due, :bank_account, :is_automatic, :is_paid, :is_money_in_account])
		else
			render json: @expense.errors, status: :unprocessable_entity
		end
		
	end

	def update
		if @expense.update(:paid => true)
			render json: @expense
		  else
			render json: @expense.errors, status: :unprocessable_entity
		  end
	end

	def destroy
		@expense.destroy
	end


	private
	def set_expense
		@expense = Expense.find(params[:id])
	end
	
	def expense_params
		params.require(:expense).permit(:id, :user_id, :description, :amount, :date_due, :bank_account, :is_automatic, :is_paid, :is_money_in_account)
	end
end
