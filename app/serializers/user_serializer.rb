class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :name, :isAdmin, :age
end
