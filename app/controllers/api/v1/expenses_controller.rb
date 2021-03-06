class Api::V1::ExpensesController < ApplicationController
	before_action :set_expense, only: [:update, :destroy]
	# def index
	# 	user = User.find_by(id: params['user_id'])
	# 	expenses = user.expenses.all
	# 	render json: debts
	# end
	
	def create
		user = User.find_by(id: expense_params['user_id'])
		debt = Debt.find_by(id: expense_params['debt_id'])
		expense = user.expenses.build(expense_params)
		if expense.save 
			if debt
				debt.expenses << expense
			end
			render json: user
		else
			render json: expense.errors, status: :unprocessable_entity
		end
	end

	def update
		if expense_params[:is_paid]  != @expense.is_paid
			 debt_exp_paid = Debt.find_by(id: expense_params['debt_id']) || Debt.find_by(id: @expense.debt_id)
		elsif expense_params['debt_id']
			debt_sel = Debt.find_by(id: expense_params['debt_id'])
		end
		
		if @expense.update(expense_params)
			if debt_exp_paid
				if(debt_exp_paid.expenses.include?(@expense))
					debt_exp_paid.update_total(@expense)
				else
					debt_exp_paid.expenses << @expense
					debt_exp_paid.update_total(@expense)
				end
				debt_exp_paid.is_debt_paid?
				debt_exp_paid.save
			end
			
			if debt_sel && !debt_sel.expenses.include?(@expense)
				debt_sel.expenses << @expense
				debt_sel.save
			end
			
			user = User.find_by(id: expense_params['user_id'])
			render json: user
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
		params.require(:expense).permit(:id, :user_id, :description, :amount, :date_due, :bank_account, :is_automatic, :is_paid, :debt_id, :debt_sel)
	end
end
