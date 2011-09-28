class GiveOnCell < Cell::Rails

  def display
    @deeds = Deed.unexpired.limit(3)
    render
  end

end
