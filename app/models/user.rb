class User < ApplicationRecord
	has_many :loglines
	has_many :ratings

	has_secure_password

	validates :name, :email, presence: true
  validates :password, presence: true, length: { minimum: 8 }, allow_nil: true
	validates :email, uniqueness: true
  validates_format_of  :email, :with => /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :bio, length: { maximum: 400 }
	validates_confirmation_of :password 
  # validates :password, length: { minimum: 8 }

  after_save :update_logline_count

	def self.find_or_create_by_omniauth(auth_hash)
    self.where(:uid => auth_hash["uid"]).first_or_create do |user|
      user.name = auth_hash["info"]["name"]
      user.email = "#{auth_hash["uid"]}@highconceptor.com" unless auth_hash["info"]["email"]
      user.password = SecureRandom.hex(8)
      user.password_confirmation = user.password
      user.save!
    end
  end
 
  scope :most_loglines, -> { where('logline_count > ?', 0).order(logline_count: :desc) }

  # def logline_total
  #   self.loglines.count
  # end

  def update_logline_count
    self.logline_count = self.loglines.count
    self.save
  end
end
