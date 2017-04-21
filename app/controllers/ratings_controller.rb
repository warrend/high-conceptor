class RatingsController < ApplicationController
  def new
  	@rating = Rating.new
  end

  def create
  	@rating = current_user.ratings.build(logline_id: params[:rating][:logline_id], rating: params[:rating][:rating])
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
