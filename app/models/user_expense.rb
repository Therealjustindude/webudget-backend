class UserExpense < ApplicationRecord
	belongs_to :user
	belongs_to :expense	
	belongs_to :debt
end
