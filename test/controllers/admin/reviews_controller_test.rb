# frozen_string_literal: true

require 'test_helper'

module Admin
  class ReviewsControllerTest < ActionDispatch::IntegrationTest
    setup do
      @admin_review = admin_reviews(:one)
    end

    test 'should get index' do
      get admin_reviews_url
      assert_response :success
    end

    test 'should get new' do
      get new_admin_review_url
      assert_response :success
    end

    test 'should create admin_review' do
      assert_difference('Admin::Review.count') do
        post admin_reviews_url,
             params: { admin_review: { author: @admin_review.author,
                                       confirmed: @admin_review.confirmed,
                                       email: @admin_review.email,
                                       review_body: @admin_review.review_body } }
      end

      assert_redirected_to admin_review_url(Admin::Review.last)
    end

    test 'should show admin_review' do
      get admin_review_url(@admin_review)
      assert_response :success
    end

    test 'should get edit' do
      get edit_admin_review_url(@admin_review)
      assert_response :success
    end

    test 'should update admin_review' do
      patch admin_review_url(@admin_review),
            params: { admin_review: { author: @admin_review.author, confirmed: @admin_review.confirmed, email: @admin_review.email,
                                      review_body: @admin_review.review_body } }
      assert_redirected_to admin_review_url(@admin_review)
    end

    test 'should destroy admin_review' do
      assert_difference('Admin::Review.count', -1) do
        delete admin_review_url(@admin_review)
      end

      assert_redirected_to admin_reviews_url
    end
  end
end
