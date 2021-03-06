class OtherShop < ActiveRecord::Base
  belongs_to :other_category
  has_many :other_subcategorizations
  has_many :other_subcategories, through: :other_subcategorizations
  has_many :comments, as: :commentable
  has_many :images, as: :imageable
  has_many :phones, as: :phoneable
  has_many :ads, as: :adable
  has_many :events, as: :eventable
  has_many :deals, as: :dealable
  has_many :likes, as: :likeable
  paginates_per 7

  
  validates :title,:other_category_id, presence: true
end
