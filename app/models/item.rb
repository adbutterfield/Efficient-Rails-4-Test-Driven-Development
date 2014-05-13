class Item < ActiveRecord::Base
  validates :name, :price, presence: true
end
