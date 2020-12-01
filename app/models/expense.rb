class Expense < ApplicationRecord
	belongs_to :user
	belongs_to :debt, optional: true

	def is_exp_paid?
		if self.amount === 0
			self.is_paid = true
		else
			self.is_paid = false
		end
		self
	end
end
