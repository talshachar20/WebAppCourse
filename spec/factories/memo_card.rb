FactoryGirl.define do
  factory :memo_card_first, class: MemoCard do
    word 'mein'
    translation 'my'
  end

  factory :memo_card_second , class: MemoCard do
    word 'dein'
    translation 'yours'
  end

  factory :memo_card_third , class: MemoCard do
    word 'sein'
    translation 'his'
  end
end
