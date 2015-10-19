require 'rails_helper'
require_relative '../../lib/answer_selector'
require_relative '../../app/controllers/memo_cards_controller'

RSpec.describe MemoCard do
  describe 'First memocard'do
    before (:example) do
      @memo_card = MemoCard.new(:word => 'talTest')
    end
    subject { @memo_card}
    let(:memo_card2) {MemoCard.new(:word => 'talTest')}

      it 'checks for default amount of wheels' do
        expect(subject.word).to eq(memo_card2.word)
      end

    describe 'AnswerSelector' do
        it 'expects the test method' do
          allow(AnswerSelector).to receive(:test_method).and_return(false)
          expect(AnswerSelector.test_method).to be(false)
      end
    end

      describe 'MemoCardsController test random four answers' do
        it 'expects the test controller method' do
          hash = ['ta', 'td', 'tz', 'sp']
         four_answers = allow(MemoCardsController.new).to receive(:get_four_random_words).and_return(hash)
         expect(four_answers).not_to be_nil
        end

        it 'expects the test controller method' do
          hash = ['ta', 'td', 'tz', 'sp']
          allow(MemoCard).to receive(:get_four_random_words).and_return(hash)
          expect(MemoCard.get_four_random_words).not_to be_nil
        end
    end
   end
  end
