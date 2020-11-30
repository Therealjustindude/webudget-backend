class Api::V1::UserSerializer < ActiveModel::Serializer
  attributes :id, :user_name, :email
  has_many :expenses 
  has_many :debts
end
