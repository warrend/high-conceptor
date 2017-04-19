class LoglinesController < ApplicationController
	before_action :set_logline, only: [:show, :edit, :update, :create]

	def index
		if params[:user_id]
      @user = User.find(params[:user_id]).loglines
    else
			@loglines = Logline.all
    end
	end

	def show
		@logline = @user.loglines.find(params[:user_id])
	end

	def new
		@logline = Logline.new
	end

	def create
		@logline = Logline.new(logline_params)
		if @logline.save
			redirect_to logline_path(@user, @logline), notice: "Successfully created a logline!"
		else
			flash[:error] = "Something went wrong!"
		end
	end

	def edit 
		
	end

	def update
		
	end

	private

		def logline_params
  		params.require(:logline).permit(:content)
		end

		def set_logline
      @logline = Logline.find_by_id(params[:id])
    end

end
