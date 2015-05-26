require_relative '../../lib/automation/memo_card_page'
require_relative '../test_helper'
require_relative '../../lib/automation/base_page'

class First < ActiveSupport::TestCase

  test "work already" do
    home_page = MemoCardPage.new
    home_page.click_on_my_status
    assert_match 'you', home_page.get_upper_part_text
  end

end
