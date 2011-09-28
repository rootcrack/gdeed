class LatestDonorsCell < Cell::Rails

  def display
    @giveons = Purchase.paid.limit(3)
    render
  end

end
