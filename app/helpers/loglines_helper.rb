module LoglinesHelper

	def current_user_rating(logline)	
		logline = current_user.ratings.where("logline_id like ?", logline)
		logline.last.rating
	end

	def has_categories?(logline)
		!logline.categories.empty?
	end

	def already_rated?(logline, user)
		logline.users.exists?(user)
	end

	def average_rating?(logline)
		logline.average_rating || "No ratings yet!"
	end

end


