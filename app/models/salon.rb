class Salon < ActiveRecord::Base
  has_many :prices
  has_many :services, through: :prices
end
