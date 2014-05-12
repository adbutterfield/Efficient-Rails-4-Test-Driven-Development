class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :city
      t.string :zipcode
      t.string :country

      t.timestamps
    end
  end
end
