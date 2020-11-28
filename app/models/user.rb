class User < ApplicationRecord
	has_many :expenses
	has_many :debts
	validates :email, :user_name, presence: true
	validates :user_name, :email, uniqueness: true
	has_secure_password
end
