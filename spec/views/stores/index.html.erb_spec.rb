require 'rails_helper'

RSpec.describe "stores/index", :type => :view do
  before(:each) do
    assign(:stores, [
      Store.create!(
        :name => "Name",
        :description => "Description"
      ),
      Store.create!(
        :name => "Name",
        :description => "Description"
      )
    ])
  end

  it "renders a list of stores" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
