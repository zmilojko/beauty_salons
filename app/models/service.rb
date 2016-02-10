class Service < ActiveRecord::Base
  has_many :prices
  has_many :salons, through: :prices

  def self.sorted_by_distance
    Service.all.sort_by(&:sorted_by_distance)
  end

  def to_param
    slug
  end
end
