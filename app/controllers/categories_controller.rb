class CategoriesController < ApplicationController
  before_action :authorize!

  def index
  	@categories = Category.all
  end

  def show
  	@category = Category.find(params[:id])
  end
end
