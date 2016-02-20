class Salon < ActiveRecord::Base
  include Distance

  def to_param
    permalink
  end

  def self.search(search)
    where("name LIKE ? or address LIKE ?", "%#{search}%","%#{search}%")
  end

  def distance_to(target)
    calculate_distance(self.lng, self.lat, target[:lng], target[:lat])
  end

  has_attached_file :image,
  :path => ":rails_root/public/system/:attachment/:id/:style-:filename",
  :url => "/system/:attachment/:id/:style-:filename",
  :styles => {
    :thumb    => ['100x100#',  :jpg, :quality => 70],
    :preview  => ['800x600#',  :jpg, :quality => 80],
    :large    => ['600>',      :jpg, :quality => 70],
    :retina   => ['1200>',     :jpg, :quality => 90]
  },
  :convert_options => {
    :thumb    => '-set colorspace sRGB -strip',
    :preview  => '-set colorspace sRGB -strip',
    :large    => '-set colorspace sRGB -strip',
    :retina   => '-set colorspace sRGB -strip -sharpen 0x0.5'
  }
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  has_many :prices
  has_many :services, through: :prices

end
