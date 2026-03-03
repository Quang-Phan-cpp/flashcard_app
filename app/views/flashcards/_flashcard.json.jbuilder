json.extract! flashcard, :id, :word, :meaning, :example, :level, :created_at, :updated_at
json.url flashcard_url(flashcard, format: :json)
