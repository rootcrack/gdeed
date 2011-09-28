class DashboardsController < ApplicationController
  def show
    @spotlight = Spotlight.first
    render 'home/index'
  end
end
