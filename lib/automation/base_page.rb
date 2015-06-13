require 'selenium-webdriver'

class Base
    ENV['base_url'] = 'http://0.0.0.0:3000/'

    def initialize
      # This is being called for each page object you will create!!!
      # Hence for each page object initialized you will recreate the @driver and open a new browser
      # Therefor her lies your problem!
      # There are many ways to handle this, one is not to create the driver in the Base initialize...
      # Or if you feel you want to do that, than you will need to change this method to be like so:
      #
      # if @driver then @driver else @driver = Selenium::WebDriver.for :chrome
      #
      @driver = Selenium::WebDriver.for :chrome #, :profile => profile
    end

    def visit(url='/')
      @driver.get ENV['base_url']
    end

    def find(locator)
      @driver.find_element(locator)
    end

    def clear(locator)
      find(locator).clear
    end

    def type(locator, input)
      find(locator).send_keys input
    end


    def displayed?(locator)
      @driver.find_element(locator).displayed?
      true
    rescue Selenium::WebDriver::Error::NoSuchElementError
      false
    end

    def text_of(locator)
      find(locator).text
    end

    def title
      @driver.title
    end

    def wait_for(seconds=5)
      Selenium::WebDriver::Wait.new(:timeout => seconds).until { yield }
    end

    def get_adress
      @driver.current_url
    end

end
