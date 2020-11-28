class DebtSerializer < ActiveModel::Serializer
  attributes :id, :title, :total, :is_paid, :user_id, :expense_id
end
