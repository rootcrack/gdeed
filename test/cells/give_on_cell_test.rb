require 'test_helper'

class GiveOnCellTest < Cell::TestCase
  test "display" do
    invoke :display
    assert_select "p"
  end
  

end
