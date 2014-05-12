class Address < ActiveRecord::Base
  belongs_to :person

  validates :street, presence: true
  validates :city, presence: true
  validates :zipcode, presence: true

  before_save :set_default_country, if: :country_nil? 

  def country_nil?
    self.country.nil?
  end

  def set_default_country
    self.country = "USA"
  end

end
