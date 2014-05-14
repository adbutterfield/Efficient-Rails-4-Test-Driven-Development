class CreateItemsOrders < ActiveRecord::Migration
  def change
    create_table :items_orders, id: false do |t|
      t.references :item, index: true
      t.references :order, index: true
    end
  end
end
