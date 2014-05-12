class Person < ActiveRecord::Base
  validates :first_name, presence: true
  # validates :middle_name, allow_blank: true
  validates :last_name, presence: true

  has_many :addresses

  def full_name
    if self.middle_name.nil?
      return "#{self.first_name} #{self.last_name}"
    else
      return "#{self.first_name} #{self.middle_name} #{self.last_name}"
    end  
  end
end
