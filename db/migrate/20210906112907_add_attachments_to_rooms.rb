# frozen_string_literal: true

class AddAttachmentsToRooms < ActiveRecord::Migration[6.1]
  def change
    add_column :rooms, :attachments, :json
  end
end
