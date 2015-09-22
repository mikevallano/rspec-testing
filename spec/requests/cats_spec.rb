require 'rails_helper'

RSpec.describe "Cats", :type => :request do
  describe "GET /cats" do
    it "works! (now write some real specs)" do
      get cats_path
      expect(response.status).to be(200)
    end
  end
end
