require "application_system_test_case"

class Admin::ReviewsTest < ApplicationSystemTestCase
  setup do
    @admin_review = admin_reviews(:one)
  end

  test "visiting the index" do
    visit admin_reviews_url
    assert_selector "h1", text: "Admin/Reviews"
  end

  test "creating a Review" do
    visit admin_reviews_url
    click_on "New Admin/Review"

    fill_in "Author", with: @admin_review.author
    check "Confirmed" if @admin_review.confirmed
    fill_in "Email", with: @admin_review.email
    fill_in "Review body", with: @admin_review.review_body
    click_on "Create Review"

    assert_text "Review was successfully created"
    click_on "Back"
  end

  test "updating a Review" do
    visit admin_reviews_url
    click_on "Edit", match: :first

    fill_in "Author", with: @admin_review.author
    check "Confirmed" if @admin_review.confirmed
    fill_in "Email", with: @admin_review.email
    fill_in "Review body", with: @admin_review.review_body
    click_on "Update Review"

    assert_text "Review was successfully updated"
    click_on "Back"
  end

  test "destroying a Review" do
    visit admin_reviews_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Review was successfully destroyed"
  end
end
