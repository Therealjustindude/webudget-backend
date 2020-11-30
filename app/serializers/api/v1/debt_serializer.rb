class DebtSerializer < ActiveModel::Serializer
  attributes :id, :title, :total, :is_paid, :user_id
  belongs_to :user
  has_many :expenses
end
