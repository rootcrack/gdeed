class Admin::GiveonsController < Admin::BaseController
  
  def index
    @giveons = Purchase.page(params[:page]).per(100)
  end
end
