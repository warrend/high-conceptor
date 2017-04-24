class RatingsController < ApplicationController
  def new
  	@rating = Rating.new
  end

  def create
    @rating = Rating.new(logline_id: params[:rating][:logline_id], user_id: current_user.id, rating: params[:rating][:rating])
		if @rating.save
    	redirect_to loglines_path, notice: "Successfully added a rating."
    else
    	redirect_to root_path, alert: "Could not create rating"
    end
  end

  private

  	def rating_params
      params.require(:rating).permit(:rating)
    end
end
