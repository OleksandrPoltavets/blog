class AddFuelCommentsToTrip < ActiveRecord::Migration
  def change
    add_column :trips, :fuel_avg, :float
    add_column :trips, :fuel_price, :float
    add_column :trips, :comments, :string
  end
end
