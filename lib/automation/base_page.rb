require 'selenium-webdriver'
require 'capybara/rspec'
require_relative '../../lib/automation/memo_card_page'

class Base

   def try_a_few_times(how_many=5, tries=0, &block)
     begin
       sleep(1)
       yield
     rescue Exception => exception
       raise exception if tries > how_many
       sleep 2
       try_a_few_times how_many, tries + 1, &block
     end
   end

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
      try_a_few_times do
         @@driver.find_element(locator)
      end
    end

   def find_elements(locator)
     @@driver.find_elements(locator)
   end

    def clear(locator)
      find(locator).clear
    end

    def type(locator, input)
      find(locator).clear
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
      sleep(1)
      @@driver.current_url
    end

    def wait_until_element_displayed(locator)
      wait.until locator.displayed?
    end

    def find_element(element)
      @@driver.find_element(element)
    end

end