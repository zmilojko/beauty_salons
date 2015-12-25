class Price < ActiveRecord::Base
  has_many :salons
  has_many :services
end
