module LoglinesHelper

	def current_user_rating(logline)	
		logline = current_user.ratings.where("logline_id like ?", logline)
		logline.last.rating
	end

	# def display_categories
	# 	if !logline.category.empty?
	# 		content_tag(:h1, "Categories")
	# 		logline.categories.each do |category|
	# 			link_to(content_tag(:span, category.name, category_path(category)))
	# 		end
	# 	end
	# end

end


