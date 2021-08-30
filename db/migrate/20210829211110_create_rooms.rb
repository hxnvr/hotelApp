class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :room_number
      t.string :room_sedcription

      t.timestamps
    end
  end
end
