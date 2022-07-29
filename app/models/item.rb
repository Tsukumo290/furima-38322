class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :name,             presence: true, length: { maximum: 40 }
  validates :description,      presence: true, length: { maximum: 1000 }
  validates :category_id,      presence: true
  validates :condition_id,     presence: true
  validates :postage_id,       presence: true
  validates :prefecture_id,    presence: true
  validates :shipping_date_id, presence: true
  validates :price,            presence: true
end
