require 'rails_helper'

feature "AddNewStores", :type => :feature do

  let(:admin) { FactoryGirl.create(:admin) }
  let(:account_owner) { FactoryGirl.create(:account_owner) }
  let(:manager) { FactoryGirl.create(:manager) }
  let(:counselor) { FactoryGirl.create(:counselor) }
  let(:user) { FactoryGirl.create(:user) }


  it "should require the user log in before adding a store" do

    visit new_store_path

    admin
    account_owner
    manager
    counselor
    user

    within "#new_user" do
      fill_in "user_email", with: manager.email
      fill_in "user_password", with: manager.password
      binding.pry
    end

    click_button "Log in"

    within "#new_store" do
      fill_in "store_name", with: "This is the name of the store!"
      fill_in "store_description", with: "This is the description of the store"
    end

    click_link_or_button "Create Store"

    expect(Store.count).to eq(1)
    expect(Store.first.name).to eq("This is the name of the store!")
    expect(Store.first.description).to eq("This is the description of the store")
  end

  it "should create a new store with a logged in user" do
    login_as create(:admin)#, scope: :user

    visit new_store_path
    # puts page.body

    within "#new_store" do
      fill_in "store_name", with: "This is the name of the store!"
      fill_in "store_description", with: "This is the description of the store"
    end

    click_link_or_button "Create Store"

    expect(Store.count).to eq(1)
    expect(Store.first.name).to eq("This is the name of the store!")
    expect(Store.first.description).to eq("This is the description of the store")
  end

end