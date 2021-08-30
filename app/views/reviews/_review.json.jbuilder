json.extract! review, :id, :author, :email, :review_body, :created_at, :updated_at
json.url review_url(review, format: :json)
