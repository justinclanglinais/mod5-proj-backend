class Session < ApplicationRecord
  belongs_to :category
  belongs_to :topic
  belongs_to :user
  has_many :enrollments
  has_many :users, through: :enrollments
end
