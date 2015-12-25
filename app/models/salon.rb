class Salon < ActiveRecord::Base
  belongs_to :prices
  has_many :services, through: :prices
end
