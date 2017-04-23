class PagesController < ApplicationController
  def index
  	if logged_in?
  		redirect_to loglines_path
  	end
  end

  def about
  end
end
