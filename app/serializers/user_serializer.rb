class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :name, :isAdmin, :age, :belt, :img_url, :sessions

  def sessions
    ActiveModel::SerializableResource.new(object.sessions, each_serializer: SessionSerializer)
  end
end