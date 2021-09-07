# frozen_string_literal: true

class AddDatesToReservation < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :checkin_date, :string
    add_column :reservations, :checkout_date, :string
  end
end
