# frozen_string_literal: true

require 'rails_helper'
RSpec.describe ReservationsController, type: :controller do
  describe 'POST #create' do
    it 'creates a reservation' do
      room = Room.create(number: '123', description: 'aaaaaaaaaaaaaaaaaaaaaa', price: '1299')
      # reservation = Room.reservation.create(name: 'dd', email: 'aa@mail.ru', checkout_date: '2021-10-2',checkin_date: '2021-10-2')
      post :create,
           params: { room: room,
                     reservation: { name: 'dd', email: 'aa@mail.ru', checkout_date: '2021-10-2', checkin_date: '2021-10-2' } }
      expect(assigns(:reservation)).to be_a(Room.reservation)
    end
  end
end

# some problems here