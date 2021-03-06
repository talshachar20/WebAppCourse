require "#{Rails.root}/spec/spec_helper"
require "#{Rails.root}/lib/automation/memo_card_page"
require "#{Rails.root}/lib/automation/login_page"
require "#{Rails.root}/lib/automation/new_memo_card_page"

describe 'Testing login page' do
  entry_data = {
      user_email: "tal.shachar202@gmail.com",
      user_password: "tazos128",
      memo_word:  "tal",
      memo_translation: "test",
      answer: "my",
  }

  appTest = nil
  before(:each) do
    User.destroy_all
    Languages.destroy_all
    MemoCard.destroy_all
    FactoryGirl.create(:languages)
    FactoryGirl.create(:user)
    FactoryGirl.create(:memo_card_first , :lang_id=> 1)
    appTest = Base.new(Selenium::WebDriver.for :chrome)
    wait = Selenium::WebDriver::Wait.new(timeout: 10)
  end

  after(:each) do
    appTest.quit
  end

  context 'go to the login page' do
    it 'should asset url of login page' do
      result = appTest.visit_page.click_on_my_status
      result = result.navigate_to_login_page
      result_title = result.get_adress
      expect(result_title).to be == 'http://0.0.0.0:3000/users/sign_in'
    end

    it 'should login with credentials' do
      result = appTest.visit_page.click_on_my_status
      result = result.navigate_to_login_page
      result.type_user_mail(entry_data[:user_email])
      result.type_password(entry_data[:user_password])
      result = result.submit_login
      newDesign = result.new_design_status
      newDesign.should include("Word status:")
    end
  end

  context 'memo cards page' do
    it 'should include only memo card from the same lang_id' do
        FactoryGirl.create(:memo_card_second, word: 'tal' , translation: 'test', lang_id: 2 )
        result = appTest.visit_page.click_on_my_status
        result = result.navigate_to_login_page
        result.type_user_mail(entry_data[:user_email])
        result.type_password(entry_data[:user_password])
        result = result.submit_login
        memo_cards = result.count_memo_cards
        expect(memo_cards).to eq(1)
    end
  end

  context 'memo card index page' do
    before (:each) do
      FactoryGirl.create(:memo_card_second, :word => 'dein' , :translation => 'yours' , :lang_id => 1)
    end
    it 'should include 2 memo cards from the same lang_id' do
      result = appTest.visit_page.click_on_my_status
      result = result.navigate_to_login_page
      result.type_user_mail(entry_data[:user_email])
      result.type_password(entry_data[:user_password])
      result = result.submit_login
      memo_card_array = [result.choose_text_memo_card_by_index(1), result.choose_text_memo_card_by_index(2)]
      expect(memo_card_array.first).to include("mein")
      expect(memo_card_array.second).to include('dein')
    end

    it 'add new memo card button' do
      result = appTest.visit_page.click_on_my_status
      result = result.navigate_to_login_page
      result.type_user_mail(entry_data[:user_email])
      result.type_password(entry_data[:user_password])
      result = result.submit_login
      result = result.click_on_new_memo_card
      result.type_memo_card_word(entry_data[:memo_word])
      result.type_memo_card_translation(entry_data[:memo_translation])
      result = result.submit_memo_Card
      question = result.get_question_text
      expect(question).to include(entry_data[:memo_word])
    end
  end

  context 'question page' do
    it 'should include the correct answer out of the 4' do
      result = appTest.visit_page.click_on_my_status
      result  = result.navigate_to_login_page
      result.type_user_mail(entry_data[:user_email])
      result.type_password(entry_data[:user_password])
      result = result.submit_login
      result = result.click_memo_card_by_index(1)
      answer = result.find_answer_by_word('my')
      expect(answer).to be true
    end

    it 'should return true when clicking on the correct answer' do
      result = appTest.visit_page.click_on_my_status
      result  = result.navigate_to_login_page
      result.type_user_mail(entry_data[:user_email])
      result.type_password(entry_data[:user_password])
      result = result.submit_login
      result = result.click_memo_card_by_index(1)
      result.click_on_answer_by_word('my')
      result = result.back_to_index_page
      expect(result.right_answers_text).to include('1')
      expect(result.wrong_answers_text).to include('0')
    end
  end
end
