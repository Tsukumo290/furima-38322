class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase_history
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :category
  belongs_to :condition
  belongs_to :postage
  belongs_to :shipping_date

  validates :image,            presence: true
  validates :name,             presence: true, length: { maximum: 40 }
  validates :description,      presence: true, length: { maximum: 1000 }
  validates :category_id,      presence: true, numericality: { other_than: 0, message: "can't be blank" }
  validates :condition_id,     presence: true, numericality: { other_than: 0, message: "can't be blank" }
  validates :postage_id,       presence: true, numericality: { other_than: 0, message: "can't be blank" }
  validates :prefecture_id,    presence: true, numericality: { other_than: 0, message: "can't be blank" }
  validates :shipping_date_id, presence: true, numericality: { other_than: 0, message: "can't be blank" }
  with_options presence: true, format: { with: /\A[0-9]+\z/, message: 'is invalid. Input half-width characters' } do
    validates :price,
              numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999,
                              message: 'out of setting range' }
  end
end
