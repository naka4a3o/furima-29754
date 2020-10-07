class UserOrder
  include ActiveModel::Model
  attr_accessor :postal_code, :item_prefecture_id, :city, :house_number, :building_name, :phone_number, :item_id, :user_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :token, :item_prefecture_id, :city, :house_number, :phone_number
  end
  validates :item_prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :phone_number, numericality: { with: /\A\d{10,11}\z/ }

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, item_prefecture_id: item_prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end
