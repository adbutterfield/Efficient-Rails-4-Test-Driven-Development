class Item < ActiveRecord::Base
  has_many :items_orders
  has_many :orders, through: :items_orders
  validates :name, :price, presence: true

  def self.by_popularity
    Item.all.sort { |a, b| b.items_orders.count <=> b.items_orders.count }
  end
end
