# frozen_string_literal: true

require 'application_system_test_case'

module Admin
  class RoomsTest < ApplicationSystemTestCase
    setup do
      @admin_room = admin_rooms(:one)
    end

    test 'visiting the index' do
      visit admin_rooms_url
      assert_selector 'h1', text: 'Admin/Rooms'
    end

    test 'creating a Room' do
      visit admin_rooms_url
      click_on 'New Admin/Room'

      fill_in 'Description', with: @admin_room.description
      fill_in 'Image', with: @admin_room.image
      fill_in 'Number', with: @admin_room.number
      click_on 'Create Room'

      assert_text 'Room was successfully created'
      click_on 'Back'
    end

    test 'updating a Room' do
      visit admin_rooms_url
      click_on 'Edit', match: :first

      fill_in 'Description', with: @admin_room.description
      fill_in 'Image', with: @admin_room.image
      fill_in 'Number', with: @admin_room.number
      click_on 'Update Room'

      assert_text 'Room was successfully updated'
      click_on 'Back'
    end

    test 'destroying a Room' do
      visit admin_rooms_url
      page.accept_confirm do
        click_on 'Destroy', match: :first
      end

      assert_text 'Room was successfully destroyed'
    end
  end
end
