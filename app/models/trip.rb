class Trip < ActiveRecord::Base
  belongs_to :user

  validates :city_from, :city_to, :mileage, :fuel_avg, :fuel_price, :presence => true

end
