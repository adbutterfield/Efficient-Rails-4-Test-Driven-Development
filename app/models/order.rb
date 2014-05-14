class Order < ActiveRecord::Base
  belongs_to :customer, class_name: "Person", foreign_key: "customer_id"
  has_many :items_orders, :dependent => :destroy
  has_many :items, through: :items_orders

  validates :customer, presence: true
  validate :must_have_at_least_one_item

  def must_have_at_least_one_item
    if self.items.empty? 
      errors.add(:items, "order must have at least one item")
    end
  end
end
