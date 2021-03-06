class CreateTrips < ActiveRecord::Migration[7.0]
  def change
    create_table :trips do |t|
      t.string :name
      t.string :destination
      t.boolean :vip
      t.decimal :price
      t.string :image
      t.text :description

      t.timestamps
    end
  end
end
