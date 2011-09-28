class HomeController < ApplicationController
  skip_before_filter :authenticate_user!, :except => :wall
  
  def index
    @spotlight = Spotlight.first
    unless @spotlight.nil?
      @contribution = @spotlight.deed.price + @spotlight.deed.contribution
    end
    @donations = Purchase.paid.order("created_at DESC").page(params[:page]).per(3)
    if user_signed_in?
      if current_user.is_admin?
        redirect_to admin_dashboard_path
      else
        redirect_to "/dashboard"
      end
    end
  end
  
  def deeds
    @deeds = Deed.active.active.page(params[:page]).per(10)
  end
  
  def contactus
    unless params[:email].nil?
      ContactUs::contact_email.deliver(params[:email])
    end
  end
  
  def wall
    @benefactors = current_user.purchases.pending
  end
  
end
