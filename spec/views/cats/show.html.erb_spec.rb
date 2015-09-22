require 'rails_helper'

RSpec.describe "cats/show", :type => :view do
  before(:each) do
    @cat = assign(:cat, Cat.create!(
      :name => "Name",
      :description => "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Description/)
  end
end
