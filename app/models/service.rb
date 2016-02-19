class Service < ActiveRecord::Base
  has_many :prices
  has_many :salons, through: :prices

  def distance_to(target)
    calculate_distance(self.lng, self.lat, target[:lng], target[:lat])
  end

  def to_param
    slug
  end
end
