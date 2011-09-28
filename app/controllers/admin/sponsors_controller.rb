class Admin::SponsorsController < Admin::BaseController
  
  def index
    @sponsors = Sponsor.page(params[:page]).per(10)
  end
  
  def verify
    @sponsor = Sponsor.find(params[:id])
    @sponsor.verify
    SponsorMailer::account_verified(@sponsor).deliver
  end
  
  def deny
    @sponsor = Sponsor.find(params[:id])
    @sponsor.deny
  end
end
