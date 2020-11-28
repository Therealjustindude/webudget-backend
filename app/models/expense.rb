class Expense < ApplicationRecord
	belongs_to :user
	belongs_to :debt, optional: true
end
