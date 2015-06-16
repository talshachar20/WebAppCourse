class DRIVER
  def setup
    @driver = Selenium::WebDriver.for :chrome
  end

  def run
    setup
    yield
    teardown
  end

  def teardown
    @driver.quit
  end
end