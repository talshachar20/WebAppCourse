require_relative '../spec_helper'
require_relative '../../spec/rails_helper'
require_relative '../../lib/free_script'

describe 'Free script' do
  let(:romantic_date) { RomanticDate::Date.new('Ran', 'Test', 'Gal', 'Test2', 'gay_male', 'gay_male') }
  subject { romantic_date.date_string }

  context 'when defining new romantic meeting' do
    it 'sets the correct string' do
      expect(subject).to eq('The date between Ran and Gal will take place in Berlin')
    end
  end


  context 'when changing the city of the meeting' do
    let(:new_meeting_location) { romantic_date.change_meeting_location('London') }

    it 'updates accordingly' do
      expect(new_meeting_location).to eq('London')
      expect(subject).to eq('The date between Ran and Gal will take place in London')
    end
  end

  context 'when there is no match in sexual ref' do
    let(:changed_sexual_ref) { romantic_date.member2.sexual_ref = 'straight_male' }

    it 'doesnt show date string' do
      expect(changed_sexual_ref).to eq('straight_male')
      expect(subject).to be(nil)
    end
  end

  context 'unit test for is_same_sexual_ref' do
    context 'when both gay male' do
      let(:changed_sexual_ref_member1) { romantic_date.member1.sexual_ref = 'gay_male' }
      let(:changed_sexual_ref_member2) { romantic_date.member2.sexual_ref = 'gay_male' }

      it 'returns true' do
        expect(romantic_date.is_same_sexual_ref).to eq(true)
      end
    end

    context 'when straight male and straight female' do
      let(:changed_sexual_ref_member1) { romantic_date.member1.sexual_ref = 'straight_male' }
      let(:changed_sexual_ref_member2) { romantic_date.member2.sexual_ref = 'straight_female' }

      it 'returns true' do
        expect(romantic_date.is_same_sexual_ref).to eq(true)
      end
    end

    context 'when straight male and gay female' do
      let(:changed_sexual_ref_member1) { romantic_date.member1.sexual_ref = 'straight_male' }
      let(:changed_sexual_ref_member2) { romantic_date.member2.sexual_ref = 'gay_female' }

      it 'returns false' do
        expect(changed_sexual_ref_member1).to eq('straight_male')
        expect(changed_sexual_ref_member2).to eq('gay_female')
        expect(romantic_date.is_same_sexual_ref).to eq(false)
      end
    end

    context 'when straight male and gay male' do
      let(:changed_sexual_ref_member1) { romantic_date.member1.sexual_ref = 'straight_male' }
      let(:changed_sexual_ref_member2) { romantic_date.member2.sexual_ref = 'gay_male' }

      it 'returns false' do
        expect(changed_sexual_ref_member1).to eq('straight_male')
        expect(changed_sexual_ref_member2).to eq('gay_male')
        expect(romantic_date.is_same_sexual_ref).to eq(false)
      end
    end

    context 'when no sexual ref is specified' do
      let(:changed_sexual_ref_member1) { romantic_date.member1.sexual_ref = '' }
      let(:changed_sexual_ref_member2) { romantic_date.member2.sexual_ref = '' }
      it 'returns false' do
        expect(changed_sexual_ref_member1).to eq('')
        expect(changed_sexual_ref_member2).to eq('')
        expect(romantic_date.is_same_sexual_ref).to eq(false)
      end
    end
  end
end
