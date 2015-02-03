json.array!(@memo_cards) do |memo_card|
  json.extract! memo_card, :id, :word, :id
  json.url memo_card_url(memo_card, format: :json)
end
