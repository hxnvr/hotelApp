# frozen_string_literal: true

require 'test_helper'

module Admin
  class RoomsControllerTest < ActionDispatch::IntegrationTest
    setup do
      @admin_room = admin_rooms(:one)
    end

    test 'should get index' do
      get admin_rooms_url
      assert_response :success
    end

    test 'should get new' do
      get new_admin_room_url
      assert_response :success
    end

    test 'should create admin_room' do
      assert_difference('Admin::Room.count') do
        post admin_rooms_url,
             params: { admin_room: { description: @admin_room.description, image: @admin_room.image,
                                     number: @admin_room.number } }
      end

      assert_redirected_to admin_room_url(Admin::Room.last)
    end

    test 'should show admin_room' do
      get admin_room_url(@admin_room)
      assert_response :success
    end

    test 'should get edit' do
      get edit_admin_room_url(@admin_room)
      assert_response :success
    end

    test 'should update admin_room' do
      patch admin_room_url(@admin_room),
            params: { admin_room: { description: @admin_room.description, image: @admin_room.image,
                                    number: @admin_room.number } }
      assert_redirected_to admin_room_url(@admin_room)
    end

    test 'should destroy admin_room' do
      assert_difference('Admin::Room.count', -1) do
        delete admin_room_url(@admin_room)
      end

      assert_redirected_to admin_rooms_url
    end
  end
end
