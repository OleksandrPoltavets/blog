class User < ActiveRecord::Base
  has_secure_password

  #attr_accessible :email, :password, :password_confirmation

  validates :name, :email, :presence => true
  validates_uniqueness_of :email


end
