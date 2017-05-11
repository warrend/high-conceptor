class LoglinesController < ApplicationController
	before_action :authorize!
	before_action :set_logline, only: [:edit, :update, :create]

	def index
		if params[:user_id]
      @user = User.find(params[:user_id])
			@loglines = @user.loglines.reverse
    else
			@loglines = Logline.all.reverse
    end
	end

	def new
		@logline = Logline.new
	end

	def show
		if params[:user_id]
			@user = User.find(params[:user_id])
			@logline = @user.loglines.find_by_id(params[:id])
		else
			@logline = Logline.find_by_id(params[:id])
		end
	end

	def create
		@user = current_user
		@logline = @user.loglines.new(logline_params)
		if @logline.save
			@user.logline_count += 1
			@user.save
			redirect_to user_logline_path(@user, @logline), notice: "Successfully created a logline!"
		else
			render :new
		end
	end

	def edit 
		
	end

	def update
		
	end

	private

		def logline_params
  		params.require(:logline).permit(:content, category_ids:[], categories_attributes: [:name])
		end

		def set_logline
      @logline = Logline.find_by_id(params[:id])
    end

end
