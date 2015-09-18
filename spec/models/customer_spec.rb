require 'rails_helper'

RSpec.describe Customer, :type => :model do

  before(:context) do
    @customer = Customer.create(name: "skinny pete")
  end

  it "has a name of skinny pete" do
    expect(@customer.name).to eql("skinny pete")
  end

  # after(:context) { @customer.destroy }

end #final ender
