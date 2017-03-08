json.extract! review, :id, :score, :comments, :paper_id, :created_at, :updated_at
json.url review_url(review, format: :json)
