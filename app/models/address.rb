class Address < ActiveRecord::Base
  belongs_to :person

  validates :street, :city, :zipcode, :state, presence: true
  validates :state, length: { is: 2 }
  before_save :set_default_country, if: :country_field_is_blank? 


  private
    def country_field_is_blank?
      #use :blank? rather than :nil?, because :blank? checks for both nil and empty string
      self.country.blank?
    end

    def set_default_country
      self.country = "USA"
    end

end
