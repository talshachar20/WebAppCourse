json.array!(@false_words) do |false_word|
  json.extract! false_word, :id, :word_id, :word, :level
  json.url false_word_url(false_word, format: :json)
end
