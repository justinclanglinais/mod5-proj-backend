class SessionSerializer < ActiveModel::Serializer
  attributes :id, :time, :topic, :category, :user
end
