class Service < ActiveRecord::Base
  has_many :prices
  has_many :salons, through: :prices
end
