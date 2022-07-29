class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :category
  belongs_to :condition
  belongs_to :postage
  belongs_to :shipping_date

  validates :name,             presence: true, length: { maximum: 40 }
  validates :description,      presence: true, length: { maximum: 1000 }
  validates :category_id,      presence: true, numericality: { other_than: 0 , message: "can't be blank" } 
  validates :condition_id,     presence: true, numericality: { other_than: 0 , message: "can't be blank" }
  validates :postage_id,       presence: true, numericality: { other_than: 0 , message: "can't be blank" }
  validates :prefecture_id,    presence: true, numericality: { other_than: 0 , message: "can't be blank" } 
  validates :shipping_date_id, presence: true, numericality: { other_than: 0 , message: "can't be blank" }
  validates :price,            presence: true
end
