class SuccessStoryCell < Cell::Rails

  def display
    @stories = Story.published.limit(3)
    render
  end

end
