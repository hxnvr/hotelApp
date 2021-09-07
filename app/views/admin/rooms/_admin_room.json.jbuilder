# frozen_string_literal: true

json.extract! admin_room, :id, :number, :description, :image, :created_at, :updated_at
json.url admin_room_url(admin_room, format: :json)
