class AddStateToAddress < ActiveRecord::Migration
  def change
    add_column :addresses, :state, :string, :limit => 2
  end
end
