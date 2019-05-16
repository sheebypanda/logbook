json.extract! event, :id, :user_id, :si_id, :priority_id, :category_id, :subject_id, :date, :description, :disable, :recurrent, :created_at, :updated_at
json.url event_url(event, format: :json)
