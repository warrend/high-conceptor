class UsersController < ApplicationController
  def new
  	@user = User.new
  end

	def show
		@user = User.find_by_id(params[:id])
	end

	def create
	  user = User.new(user_params)
	  if user.save
	    session[:user_id] = user.id
	    redirect_to root_path
	  else
	    redirect_to signup_path
	  end
	end

	def edit
		@user = User.find_by_id(params[:id])
	end

	def update
		@user = User.find_by_id(params[:id])
		@user.bio = params[:bio]
		@user.save
		redirect_to user_path(@user)
	end


	
	private 

		def user_params
  		params.require(:user).permit(:name, :email, :bio, :password, :password_confirmation)
		end
end
