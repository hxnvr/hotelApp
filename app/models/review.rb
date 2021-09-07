# frozen_string_literal: true

class Review < ApplicationRecord
  validates :author, presence: true
  validates :email, presence: true
  validates :review_body, presence: true
end
