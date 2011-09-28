class PurchasesController < ApplicationController
  
  def success
  end

  def create
    @deed = Deed.find(params[:purchase][:deed_id])
    @purchase = Purchase.new(params[:purchase])
    @purchase.ip_address = request.remote_ip
    @purchase.user = current_user
    @purchase.amount = @deed.price
    if @purchase.save
      redirect_to success_purchases_path
    else
      flash.now[:notice] = @purchase.errors.full_messages.first
      @purchase.deed = @deed
      render 'new'
    end
  end
end