class Debt < ApplicationRecord
	belongs_to :user
	has_many :expenses

	def is_debt_paid?
		if self.total === 0
			self.is_paid = true
		else
			self.is_paid = false
		end
		self
	end

	def update_total(exp)
			if exp.is_paid
				exp_total = 0
				exp_total += exp.amount
				debt_total = self.total - exp_total
				self.total = debt_total
			else
				exp_total = 0
				exp_total += exp.amount
				debt_total = self.total + exp_total
				self.total = debt_total
			end
		self
	end
end
