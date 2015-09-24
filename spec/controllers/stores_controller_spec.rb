require 'rails_helper'

RSpec.describe StoresController, :type => :controller do
  describe "anonymous user" do
    # before :each do
    #   # This simulates an anonymous user
    #   login_with nil
    # end

    it "should be redirected to signin" do
      login_with nil
      get :index
      expect(response).to redirect_to(new_user_session_path)
    end

    it "should let a user see all the stores" do
      login_with create(:admin)
      get :index
      expect(response).to render_template(:index)
    end

  end
end