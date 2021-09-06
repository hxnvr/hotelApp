class ReservationsController < ApplicationController

  def create
    @room = Room.find(params[:room_id])
    @reservation = @room.reservations.create(reservation_params)
    redirect_to rooms_path
  end


  private

  def reservation_params
    params.require(:reservation).permit(:name, :email, :checkout_date, :checkin_date)
  end
end
