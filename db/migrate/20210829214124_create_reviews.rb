class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.string :author
      t.string :email
      t.text :review_body

      t.timestamps
    end
  end
end
