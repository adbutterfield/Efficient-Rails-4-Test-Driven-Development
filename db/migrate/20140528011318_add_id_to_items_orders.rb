class AddIdToItemsOrders < ActiveRecord::Migration
  def change
    add_column :items_orders, :id, :primary_key
    # add_column(:items_orders, :created_at, :datetime)
    # add_column(:items_orders, :updated_at, :datetime)
  end
end
