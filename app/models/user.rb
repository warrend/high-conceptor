class User < ApplicationRecord
	has_many :loglines
	has_many :ratings

	has_secure_password

	validates_presence_of :name, :email, :password 
	validates :email, uniqueness: true
	validates_confirmation_of :password 
end
