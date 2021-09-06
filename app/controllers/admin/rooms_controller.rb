class Admin::RoomsController < ApplicationController
  before_action :set_admin_room, only: %i[ show edit update destroy ]
  before_action :require_login
  # GET /admin/rooms or /admin/rooms.json
  def index
    @admin_rooms = Room.all
  end

  # GET /admin/rooms/1 or /admin/rooms/1.json
  def show
  end

  # GET /admin/rooms/new
  def new
    @admin_room = Room.new
  end

  # GET /admin/rooms/1/edit
  def edit
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_room
      @admin_room = Room.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def admin_room_params
      params.require(:admin_room).permit(:number, :description, :price, {attachments: []})
    end
end
