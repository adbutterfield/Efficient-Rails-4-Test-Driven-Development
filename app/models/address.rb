class Address < ActiveRecord::Base
  belongs_to :person

  validates :street, :city, :zipcode, presence: true

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
