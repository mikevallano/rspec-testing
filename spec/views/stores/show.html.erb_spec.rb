require 'rails_helper'

RSpec.describe "stores/show", :type => :view do
  before(:each) do
    @store = assign(:store, Store.create!(
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
