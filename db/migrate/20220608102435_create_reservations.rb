class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.datetime :date
      t.belongs_to :trip, null: false, foreign_key: true

      t.timestamps
    end
  end
end
