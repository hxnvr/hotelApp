# frozen_string_literal: true

module Admin
  class ReservationsController < ApplicationController
    before_action :set_reservation, only: %i[edit update destroy]
    before_action :require_login
    def index
      @reservations = Reservation.all.order(created_at: :desc)
      respond_to do |format|
        format.html
        format.xlsx
      end
    end

    def edit; end

    def update
      respond_to do |format|
        if @reservation.update(reservation_params)
          format.html { redirect_to '/admin/reservations', notice: 'Reservation was successfully confirmed.' }
        else
          format.html { render :edit, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @reservation.destroy
      respond_to do |format|
        format.html { redirect_to '/admin/reservations', notice: 'Reservation was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private

    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

    def reservation_params
      params.require(:reservation).permit(:name, :email, :checkout_date, :checkin_date, :confirmed)
    end
  end
end
