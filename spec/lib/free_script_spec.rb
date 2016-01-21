require 'rails_helper'
require_relative '../../spec/spec_helper'
require '/Users/tal/TalWebCourse01/blog/lib/free_script.rb'

describe "Free script " do
  let(:romantic_date) {
    RomanticDate::Date.new('Tal', 'Test', 'Gal', 'Test2')
  }
  subject {romantic_date.date_string}

  context "when defining new romantic meeting" do
    it "sets the correct string" do
      expect(subject).to eq('The date between Tal and Gal will take place in Berlin')
    end
  end

  context "when changing the city of the meeting" do
    let(:new_meeting_location) {
      romantic_date.change_meeting_location('London')
    }
    it 'updates accordingly' do
      expect(new_meeting_location).to eq('London')
      expect(subject).to eq('The date between Tal and Gal will take place in London')
    end
  end
end
