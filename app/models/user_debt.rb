class UserDebt < ApplicationRecord
	belongs_to :expense 
	belongs_to :debt
	belongs_to :user
end
