module UsersHelper
	def show_bio(user)
		user.bio || "You don't have a bio yet!"
	end	
end
