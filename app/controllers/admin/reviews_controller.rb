# frozen_string_literal: true

module Admin
  class ReviewsController < ApplicationController
    before_action :set_review, only: %i[edit]
    before_action :require_login
    # GET /admin/reviews or /admin/reviews.json
    def index
      @reviews = Review.all.order(created_at: :desc)
    end

    # GET /admin/reviews/1/edit
    def edit; end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end
  end
end
