class CreateAccommodations < ActiveRecord::Migration[6.0]
  def change
    create_table :accommodations do |t|
      t.string :title
      t.string :city
      t.string :country
      t.references :type, null: false, foreign_key: true
      t.integer :floor_area
      t.integer :bedrooms
      t.integer :bathrooms
      t.integer :min_stay_nights
      t.integer :max_guests
      t.references :rating, null: false, foreign_key: true

      t.timestamps
    end
  end
end
