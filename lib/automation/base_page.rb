require 'selenium-webdriver'
require 'capybara/rspec'
require_relative '../../lib/automation/memo_card_page'

class Base
    @@driver = nil
    ENV['base_url'] = 'http://0.0.0.0:3000/'

    def initialize(driver)
      @@driver = driver
      wait = Selenium::WebDriver::Wait.new(:timeout => 10)
    end

    def visit_page(url='/')
      puts "navigating #{ENV['base_url']} "
      @@driver.navigate.to ENV['base_url']
      return MemoCardPage.new(@@driver)
    end

    def quit
      @@driver.quit
    end

    def find(locator)
      # Whenever you call `find` method you actually call it here...
      # So this is a great location to implement a `wait` call as well, don't you think?
      # You can implmemnt it in several ways:
      # 1. Try a few time to find
      # 2. Use explicit wait by selenium
      #
      # Examples:
      # 
      # Selenium wait:
      # wait = Selenium::WebDriver::Wait.new(:timeout => 10)
      # wait.until { @@driver.find_element(locator) }
      #
      # Second option is to create this method and call it here by passing any method inside:
      # This is the method:
      # def try_a_few_times(how_many=5, tries=0, &block)
      #   begin
      #     yield
      #   rescue Exception => exception
      #     raise exception if tries > how_many
      #     sleep 1
      #     try_a_few_times how_many, tries + 1, &block
      #   end
      # end
      #
      # This is how you will call it:
      #
      #
      # try_a_few_times do
      #   @@driver.find_element(locator)
      # end
      @@driver.find_element(locator)
    end

    def clear(locator)
      find(locator).clear
    end

    def type(locator, input)
      find(locator).send_keys input
    end

    def click_on(locator)
      find(locator).click
    end


    def displayed?(locator)
      @@driver.find_element(locator).displayed?
      true
    rescue Selenium::WebDriver::Error::NoSuchElementError
      false
    end

    def text_of(locator)
      find(locator).text
    end

    def title
      @@driver.title
    end

    def wait_for(seconds=5)
      Selenium::WebDriver::Wait.new(:timeout => seconds).until { yield }
    end

    def get_adress
      @@driver.current_url
    end

    def wait_until_element_displayed(locator)
      wait.until locator.displayed?
    end

end
