class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.integer :user_id
      t.datetime :start
      t.datetime :finish
      t.integer :mileage
      t.string :city_from
      t.string :city_to

      t.timestamps
    end
  end
end
