module LoglinesHelper

	def current_user_rating(logline)	
		logline = current_user.ratings.where("logline_id like ?", logline )
		logline.last.rating
	end

end
