class Admin::ReviewsController < ApplicationController
  before_action :set_review, only: %i[ show edit update destroy ]
  before_action :require_login
  # GET /admin/reviews or /admin/reviews.json
  def index
    @reviews = Review.all.order(created_at: :desc)
  end


  # GET /admin/reviews/1/edit
  def edit

  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def admin_review_params
      params.require(:review).permit(:author, :email, :review_body, :confirmed)
    end
end
