class User < ApplicationRecord
	has_many :expenses
	validates :email, :user_name, :password, presence: true
	validates :user_name, :email, uniqueness: true
end
