class UsersController < ApplicationController
	

  def new
  	@user = User.new
  end

	def show
		@user = User.find_by_id(params[:id])
	end

	def create
	  @user = User.new(user_params)
	  if @user.save
	    session[:user_id] = @user.id
	    redirect_to loglines_path
	  else
	  	flash[:error] = @user.errors.full_messages.join(" | ")
	    render 'new'
	  end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params) 
			redirect_to user_path(@user)
		else
			flash[:error] = "There was a problem"
			render :edit
		end
	end


	
	private 

		def user_params
  		params.require(:user).permit(:name, :email, :bio, :password, :password_confirmation)
		end
end
