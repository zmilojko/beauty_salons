class Service < ActiveRecord::Base
  has_many :prices
  has_many :salons, through: :prices
  def to_param
    slug
  end
end
