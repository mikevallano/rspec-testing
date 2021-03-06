require 'rails_helper'

RSpec.describe Order, :type => :model do
  let(:order) { FactoryGirl.build(:order) }

  it "responds to name" do
    expect(order).to respond_to(:name)
  end

  it { should_not validate_presence_of :customer }

  it { should validate_presence_of :name }

  it "responds to orderer" do
    expect(order).to respond_to(:orderer)
  end


end
