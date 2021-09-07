# frozen_string_literal: true

json.extract! admin_review, :id, :author, :email, :review_body, :confirmed, :created_at, :updated_at
json.url admin_review_url(admin_review, format: :json)
