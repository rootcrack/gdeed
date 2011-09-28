class Admin::DeedsController < Admin::BaseController
  def index
    @spotlight = Spotlight.first
    @deeds = Deed.page(params[:page]).per(10)
  end
  
  def edit
    @deed = Deed.find(params[:id])
  end
  
  def update
    @deed = Deed.find(params[:id])
    if @deed.update_attributes(params[:deed])
      flash[:info] = "Deed successfully updated"
      redirect_to deeds_url
    else
      flash.now[:error] = @deed.errors.full_messages.first
      render :new
    end
  end
  
  def activate
    @deed = Deed.find(params[:id])
    @deed.set_status("active")
    #SponsorMailer::account_verified(@sponsor).deliver
  end
  
  def cancel
    @deed = Deed.find(params[:id])
    @deed.set_status("cancelled")
    #SponsorMailer::account_verified(@sponsor).deliver
  end
  
  def freeze
    @deed = Deed.find(params[:id])
    @deed.set_status("hold")
    #SponsorMailer::account_verified(@sponsor).deliver
  end
  
  def spotify
    spotlight = Spotlight.first
    if spotlight
      spotlight.update_attributes(:deed_id => params[:id])
    else
      spotlight = Spotlight.new
      spotlight.deed = Deed.find(params[:id])
      spotlight.save
    end
    redirect_to admin_deeds_path, :notice => "Deed set as main."
  end
  
end