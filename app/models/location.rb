class Location < ActiveRecord::Base

  has_attached_file :background, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :background, content_type: /\Aimage\/.*\Z/

  has_many :players
  has_many :location_bots
  has_many :location_resources
  has_many :bots, through: :location_bots
  has_many :resources, through: :location_resources

  validates :name, :slug, presence: true

  acts_as_tree
end
