class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.string :name
      t.string :email
      t.boolean :confirmed
      t.references :room, null: false, foreign_key: true

      t.timestamps
    end
  end
end
