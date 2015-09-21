class Order < ActiveRecord::Base
  belongs_to :customer
  validates_presence_of :customer

  def orderer
    self.customer.name
  end

end
