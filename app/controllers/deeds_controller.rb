class DeedsController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index]
  
  def index
    @deeds = Deed.active.page(params[:page]).per(10)
    if user_signed_in? && current_user.is_a_sponsor?
      @deeds = current_user.sponsor.deeds.page(params[:page]).per(10)
    elsif user_signed_in? && current_user.is_admin?
      redirect_to admin_deeds_url
    end
  end
  
  def new
    @deed = Deed.new
    unless current_user.is_a_sponsor?
      flash[:error] = "You have to be a sponsor to create a Grateful Deed."
      redirect_to new_sponsor_url
    else
      unless current_user.sponsor.is_verified
        flash[:error] = "Your account is not yet verified. Please contact our customer support for inquiries."
        redirect_to dashboard_url
      end
    end
  end
  
  def create
    @deed = Deed.new(params[:deed])
    @deed.sponsor = current_user.sponsor
    if @deed.save
      flash[:info] = "Deed successfully created"
      redirect_to dashboard_url
    else
      flash.now[:error] = @deed.errors.full_messages.first
      render :new
    end
  end
  
  def update
    @deed = Deed.find(params[:id])
    ensure_authorized
    if @deed.update_attributes(params[:deed])
      flash[:info] = "Deed successfully updated"
      redirect_to deeds_url
    else
      flash.now[:error] = @deed.errors.full_messages.first
      render :new
    end
  end
  
  def purchase
    @purchase = Purchase.new
    @deed = Deed.find(params[:id])
    @purchase.deed = @deed
    render 'purchases/new'
  end
  
  def show
    @deed = Deed.find(params[:id])
  end
  
  def edit
    @deed = Deed.find(params[:id])
    ensure_authorized
  end
  
  def destroy
    deed = Deed.find(params[:id])
  end
  
  private
  
  def ensure_authorized
    raise "You are not allowed to delete this." unless (@deed.sponsor.user == current_user || current_user.is_admin?)
  end
end
