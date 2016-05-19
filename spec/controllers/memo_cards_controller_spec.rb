require_relative '../../spec/rails_helper'
require_relative '../spec_helper'
require_relative '../../app/controllers/memo_cards_controller'
require 'pry'


RSpec.describe MemoCardsController do
  let(:memo_cards) { MemoCard.all }

  before do
    user = FactoryGirl.create(:user)
    allow(controller).to receive(:authenticate_user!).and_return(true)
    allow(controller).to receive(:current_user).and_return(user)
  end

  describe "GET index" do
    it "gets index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "GET new" do
    it "gets new template" do
      get :new
      expect(response).to render_template("new")
    end
  end
end
