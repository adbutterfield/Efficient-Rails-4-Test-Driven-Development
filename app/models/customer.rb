class Customer < Person
  has_many :orders
  has_many :items_orders, through: :orders

  # RSpec's lack of support for STI makes it necessary to put this method in the Person model
  # def ordered_items
  #   Item.includes(:orders).where('orders.customer_id = ?', self.id).references(:orders)
  # end

  def self.loyalty_program
    time_range = 90.days.ago..Time.now
  
    Person.joins(:orders, :items_orders)
      .where(orders: { created_at: time_range })
      .group('people.id')
      .having('COUNT(items_orders.id) >= ?', 2)
      .order(id: :asc)
  end

end
