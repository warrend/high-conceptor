class User < ApplicationRecord
	has_many :loglines
	has_many :ratings

	has_secure_password

	validates_presence_of :name, :email, :password 
	validates :email, uniqueness: true
	validates_confirmation_of :password 

	def self.find_or_create_by_omniauth(auth_hash)
    self.where(:uid => auth_hash["uid"]).first_or_create do |user|
      user.name = auth_hash["info"]["name"]
      user.email = "#{auth_hash["uid"]}@highconceptor.com" unless auth_hash["info"]["email"]
      user.password = SecureRandom.hex(8)
      user.password_confirmation = user.password
      user.save!
    end
  end
end
