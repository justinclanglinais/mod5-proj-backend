class User < ApplicationRecord
    has_many :enrollments
    has_many :sessions, through: :enrollments
    has_secure_password
    accepts_nested_attributes_for :sessions
    validates :email, uniqueness: { case_sensitive: false }
    def self.instructors
        User.all.select{|u| u.isAdmin}
    end
end
