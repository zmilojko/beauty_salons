class Salon < ActiveRecord::Base
  has_many :prices
  has_many :services, through: :prices
  def to_param
    permalink
  end
end
