require 'rails_helper'

RSpec.describe Customer, :type => :model do

  let(:customer) { FactoryGirl.build(:customer)}

  it "responds to name" do
    expect(customer).to respond_to(:name)
  end

  it { should validate_presence_of :name }

  it { should_not validate_presence_of :email }

  it "responds to email" do
    customer.email = "zorro@aol.com"
    expect(customer.email).to eq("zorro@aol.com")
  end

  it "responds to name_and_email" do
    customer.name = "jim ha"
    customer.email = "jim@aol.com"
    expect(customer.name_and_email).to eq("name: jim ha, email: jim@aol.com")
  end


end #final ender
