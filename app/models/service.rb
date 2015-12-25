class Service < ActiveRecord::Base
  belongs_to :prices
  has_many :salons, through: :prices
end
