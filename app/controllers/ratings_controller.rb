class RatingsController < ApplicationController
  before_action :authorize!

  def index
    @recent_ratings = Rating.recent_ratings(5)
    @highest_rated = Logline.highest_rated
  end

  def new
  	@rating = Rating.new
  end

  def create
    @rating = Rating.new(logline_id: params[:rating][:logline_id], user_id: current_user.id, rating: params[:rating][:rating])
    if @rating.save && !current_user.loglines.exists?(@rating.logline)
    	# redirect_to loglines_path, notice: "Successfully added a rating."
      render :json => @rating, notice: "Successfully added a rating."
    else
    	redirect_to root_path, alert: "Could not create rating"
    end
  end

  private

  	def rating_params
      params.require(:rating).permit(:rating)
    end
end
