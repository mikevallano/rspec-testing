require 'rails_helper'

RSpec.describe Cat, :type => :model do
  let(:cat) { FactoryGirl.build(:cat)}

  it "responds to name" do
    expect(cat.name).to eq("zorro")
  end

  it "responds to description" do
    expect(cat.description).to eq("rinestone gato")
  end

  it "responds to name and desc" do
    expect(cat.name_and_desc).to eq("zorro, rinestone gato")
  end

  it { should validate_presence_of :name }

  it { should_not validate_presence_of :description }

end
