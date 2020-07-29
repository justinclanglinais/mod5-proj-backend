class Session < ApplicationRecord
  belongs_to :category
  belongs_to :topic
  belongs_to :user
  has_many :enrollments, dependent: :delete_all
  has_many :users, through: :enrollments

  attribute :time, :datetime, default: (Faker::Time.between(from: DateTime.now - 3, to: DateTime.now + 5, format: :long))

end
