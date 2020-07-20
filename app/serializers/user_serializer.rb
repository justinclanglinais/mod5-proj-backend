class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :name, :isAdmin, :age, :belt, :img_url, :enrollments
end
