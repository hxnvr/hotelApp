# frozen_string_literal: true

json.array! @admin_reviews, partial: 'admin_reviews/admin_review', as: :admin_review
