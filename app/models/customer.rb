class Customer < ActiveRecord::Base

  has_many :orders
  validates_presence_of :name

  def name_and_email
    "name: #{self.name}, email: #{self.email}"
  end
end
