json.extract! conference, :id, :name, :paper_id, :created_at, :updated_at
json.url conference_url(conference, format: :json)
