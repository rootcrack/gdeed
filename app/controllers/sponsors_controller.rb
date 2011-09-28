class SponsorsController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index]
  
  def index
    @sponsors = Sponsor.active.page(params[:page]).per(10)
  end
  
  def new
    @sponsor = Sponsor.new
  end
  
  def create
    @sponsor = Sponsor.new(params[:sponsor])
    @sponsor.user = current_user
    if @sponsor.save
      flash[:info] = "Your application is successfully submitted. You'll receive a verification email once your application is verified."
      redirect_to dashboard_path
    else
      flash.now[:error] = @sponsor.errors.full_messages.first
      render :action => 'new'
    end
  end
  
  def show
    @sponsor = Sponsor.find(params[:id])
    @deeds = @sponsor.deeds.completed.page(params[:page]).per(10)
  end
  
  def edit
    @sponsor = Sponsor.find(params[:id])
  end
end
