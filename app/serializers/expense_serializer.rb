class ExpenseSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :description, :amount, :date_due, :bank_account, :is_automatic, :is_paid, :is_money_in_account
  belongs_to :user
end
