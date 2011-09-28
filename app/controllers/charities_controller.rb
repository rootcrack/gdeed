class CharitiesController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index]
  
  def index
    @charities = Charity.page(params[:page]).per(10)
  end
  
  def new
    @charity = Charity.new
  end
  
  def create
    @charity = Charity.new(params[:charity])
    @charity.user = current_user
    if @charity.save
      flash[:info] = "You charity account is successfully created."
      redirect_to dashboard_path
    else
      flash.now[:error] = @charity.errors.full_messages.first
      render :action => 'new'
    end
  end
  
  def show
    @charity = Charity.find(params[:id])
    @deeds = @charity.deeds.completed.page(params[:page]).per(10)
  end
  
  def edit
    @charity = Charity.find(params[:id])
  end
end
