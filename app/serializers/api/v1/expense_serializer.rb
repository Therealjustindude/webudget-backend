class Api::V1::ExpenseSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :description, :amount, :date_due, :bank_account, :is_automatic, :is_paid
  belongs_to :user
  belongs_to :debt

  
end
