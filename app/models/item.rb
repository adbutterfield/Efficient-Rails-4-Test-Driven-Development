class Item < ActiveRecord::Base
  has_many :items_orders
  has_many :orders, through: :items_orders
  validates :name, :price, presence: true

  scope :by_popularity, -> { joins('LEFT OUTER JOIN items_orders ON items_orders.item_id = items.id').
                             group('items.id').
                             order('COUNT(item_id) DESC')
                           }

  # def self.by_popularity
  #   Item.includes(:items_orders).group('items.id').order('COUNT(items_orders.item_id) DESC')
  # end
end
