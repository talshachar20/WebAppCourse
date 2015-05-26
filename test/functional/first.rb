require_relative '../../lib/automation/memo_card_page'
require_relative '../test_helper'
require_relative '../../lib/automation/driver'
require_relative '../../lib/automation/base_page'

class First < ActiveSupport::TestCase

  test "work already" do
    home_page = MemoCardPage.new(@driver)
    home_page.click_on_my_status
    home_page.search_result_present? 'ddd'
    assert_equal("ssd", "ssd", msg = nil)

    #result = google.search_result_present? 'Receive a Free, Weekly Tip'

  end

end
