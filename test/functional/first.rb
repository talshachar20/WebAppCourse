require_relative '../../spec/spec_helper'
require 'factory_girl_rails'
require_relative '../../lib/automation/memo_card_page'
require_relative '../test_helper'
require_relative '../../lib/automation/base_page'
require_relative '../../lib/automation/login_page'
require_relative '../../lib/automation/new_memo_card_page'
require 'capybara/rspec'

describe 'Testing login page' do
  #RAILS_ENV=test rails s
  #bundle exec rake db:reset RAILS_ENV=test - clean db
  #TODO - configure wait element
  #TODO - configure tags

  entry_data = {  #factory doesn't take from test db
      :user_email => "tal.shachar16@gmail.com",
      :user_password => "tazos128",
  }

  appTest = nil
  before(:each) do
    User.destroy_all
    Languages.destroy_all
    MemoCard.destroy_all
    FactoryGirl.create(:languages)
    FactoryGirl.create(:user)
    FactoryGirl.create(:memo_card , :lang_id=> 1)
    appTest = Base.new(Selenium::WebDriver.for :chrome)
    wait = Selenium::WebDriver::Wait.new(:timeout => 10)
  end

  after(:each) do
    appTest.quit
  end

  context 'go to the login page' do
    it 'should asset url of login page' do
      result = appTest.visit_page.click_on_my_status
      sleep(1)
      result = result.navigate_to_login_page
      sleep(2)
      result_title = result.get_adress
      expect(result_title).to be == 'http://0.0.0.0:3000/users/sign_in'
    end

    it 'should login with credentials' do
      result = appTest.visit_page.click_on_my_status
      result  = result.navigate_to_login_page
      sleep(2)
      result.type_user_mail(entry_data[:user_email])
      result.type_password(entry_data[:user_password])
      result = result.submit_login
      newDesign = result.new_design_status
      newDesign.should include("Word status:")
    end
  end

  context 'memo cards page' do
    it 'should include only memo card from the same lang_id' do
        FactoryGirl.create(:memo_card, :word=> 'tal' , :translation=> 'test', :lang_id=> 2 )
        result = appTest.visit_page.click_on_my_status
        result  = result.navigate_to_login_page
        sleep(2)
        result.type_user_mail(entry_data[:user_email])
        result.type_password(entry_data[:user_password])
        result = result.submit_login
        memo_cards = result.count_memo_cards
        expect(memo_cards).to be(1)
    end
  end

  context 'add memo card' do
    before (:each) do  #TODO - instead of factory create page object for new memo card
      FactoryGirl.create(:memo_card, :word=> "dein" , :translation => "yours" , :lang_id=> 1)
    end
    it 'should include 2 memo cards from the same lang_id' do
      result = appTest.visit_page.click_on_my_status
      result  = result.navigate_to_login_page
      sleep(2)
      result.type_user_mail(entry_data[:user_email])
      result.type_password(entry_data[:user_password])
      result = result.submit_login
      memo_card_array = [result.choose_memo_card_by_index(1)  ,  result.choose_memo_card_by_index(2)]
      expect(memo_card_array.first).to include("mein")
      expect(memo_card_array.second).to include("dein")
    end

    it 'clicks on new memo card button' do
      result = appTest.visit_page.click_on_my_status
      result  = result.navigate_to_login_page
      sleep(2)
      result.type_user_mail(entry_data[:user_email])
      result.type_password(entry_data[:user_password])
      result = result.submit_login
      result = result.click_on_new_memo_card
      sleep(2)
    end
  end
end

