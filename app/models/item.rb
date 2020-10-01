class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one_attached :image
  belongs_to_active_hash :category
  belongs_to_active_hash :item_status
  belongs_to_active_hash :shipping_bearer
  belongs_to_active_hash :item_prefecture
  belongs_to_active_hash :scheduled_delivery

  validates :name, :description, :category_id, :item_status_id, :shipping_bearer_id, :item_prefecture_id, :scheduled_delivery_id, :price, :image, presence: true
  validates :price, format: { with: /\A[0-9]+\z/, message: 'is invalid. Input half-width characters.' }
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is out of setting range' }

  validates :category_id, :item_status_id, :shipping_bearer_id, :scheduled_delivery_id, numericality: { other_than: 1 }
  validates :item_prefecture_id, numericality: { other_than: 0 }
end
