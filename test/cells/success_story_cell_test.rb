require 'test_helper'

class SuccessStoryCellTest < Cell::TestCase
  test "display" do
    invoke :display
    assert_select "p"
  end

end
