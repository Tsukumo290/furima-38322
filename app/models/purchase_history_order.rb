class PurchaseHistoryOrder
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :municipality, :address, :building_name, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :municipality
    validates :address
    validates :phone_number, format: {with: /\A\d{10,11}\z/ }
    validates :token
  end

  def save
    purchase_history = PurchaseHistory.create(user_id: user_id, item_id: item_id)

    Order.create(post_code: post_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, purchase_history_id: purchase_history.id)
  end
end