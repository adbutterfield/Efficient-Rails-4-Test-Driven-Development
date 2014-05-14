class AddTypeToPeople < ActiveRecord::Migration
  def change
    add_column :people, :type, :string, index: true
  end
end
