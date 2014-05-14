class Person < ActiveRecord::Base
  has_many :addresses
  has_many :orders
  has_many :messages, foreign_key: :recipient_id
  
  validates :first_name, :last_name, presence: true

  scope :find_by_names_starting_with, -> (term) { where("first_name LIKE :term OR last_name LIKE :term", {term: term << '%' }).order(last_name: :asc) }

  def full_name
    if self.middle_name.nil?
      return "#{self.first_name} #{self.last_name}"
    else
      return "#{self.first_name} #{self.middle_name} #{self.last_name}"
    end  
  end

  private

  # def self.find_by_names_starting_with(term)
  #   # old syntax
  #   # Person.all(:conditons => ["first_name LIKE :term OR last_name LIKE :term", {:term => term + '%'}],
  #   #             :order => 'last_name ASC')
  #   # new syntax
  #   Person.where("first_name LIKE :term OR last_name LIKE :term", {term: term << '%' }).order(last_name: :asc)
  #   # in this version, the query string is case sensitive
  #   # info on making the query string case insensitive: http://stackoverflow.com/questions/7005302/postgresql-how-to-make-not-case-sensitive-queries
  # end
end
