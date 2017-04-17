class User < ApplicationRecord
	has_many :loglines
	has_many :ratings

	has_secure_password
end
