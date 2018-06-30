class User < ApplicationRecord

	has_many :role_users
	has_many :roles, through: :role_users

	accepts_nested_attributes_for :role_users, allow_destroy: true
end
