class Trip < ActiveRecord::Base
  belongs_to :user

  validates :city_from, :city_to, :mileage, :presence => true
end
