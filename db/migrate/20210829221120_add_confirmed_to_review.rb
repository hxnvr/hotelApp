# frozen_string_literal: true

class AddConfirmedToReview < ActiveRecord::Migration[6.1]
  def change
    add_column :reviews, :confirmed, :boolean
  end
end
