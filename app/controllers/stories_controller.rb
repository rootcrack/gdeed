class StoriesController < ApplicationController
  
  skip_before_filter :authenticate_user!
  
  def index
    @stories = Story.published.page(params[:page]).per(5)
  end
  
  def show
    @story = Story.find(params[:id])
  end
  
end
