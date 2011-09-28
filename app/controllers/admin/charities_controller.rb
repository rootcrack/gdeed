class Admin::CharitiesController < Admin::BaseController
  
  def index
    @charities = Charity.page(params[:page]).per(10)
  end
end
