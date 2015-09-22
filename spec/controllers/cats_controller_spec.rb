require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe CatsController, :type => :controller do

  # This should return the minimal set of attributes required to create a valid
  # Cat. As you add validations to Cat, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { {name: "zorro", description: "rinestone gato"}}

  let(:invalid_attributes) { {name: nil, description: "little furball"}}

  let(:cat) { Cat.create! valid_attributes }
  let(:cats) { Cat.all }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # CatsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all cats as @cats" do
      get :index, {}, valid_session
      expect(assigns(:cats)).to eq([cat])
    end
  end

  describe "GET show" do
    it "assigns the requested cat as @cat" do
      get :show, {:id => cat.to_param}, valid_session
      expect(assigns(:cat)).to eq(cat)
    end
  end

  describe "GET new" do
    it "assigns a new cat as @cat" do
      cat
      get :new, {}, valid_session
      expect(assigns(:cat)).to be_a_new(Cat)
    end
  end

  describe "GET edit" do
    it "assigns the requested cat as @cat" do
      get :edit, {:id => cat.to_param}, valid_session
      expect(assigns(:cat)).to eq(cat)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Cat" do
        expect {
          post :create, {:cat => valid_attributes}, valid_session
        }.to change(Cat, :count).by(1)
      end

      it "assigns a newly created cat as @cat" do
        post :create, {:cat => valid_attributes}, valid_session
        expect(assigns(:cat)).to be_a(Cat)
        expect(assigns(:cat)).to be_persisted
      end

      it "redirects to the created cat" do
        post :create, {:cat => valid_attributes}, valid_session
        expect(response).to redirect_to(Cat.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved cat as @cat" do
        post :create, {:cat => invalid_attributes}, valid_session
        expect(assigns(:cat)).to be_a_new(Cat)
      end

      it "re-renders the 'new' template" do
        post :create, {:cat => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) { {name: "zorro", description: "he's crazy. i love him"} }

      it "updates the requested cat" do
        put :update, {:id => cat.to_param, :cat => new_attributes}, valid_session
        cat.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested cat as @cat" do
        put :update, {:id => cat.to_param, :cat => valid_attributes}, valid_session
        expect(assigns(:cat)).to eq(cat)
      end

      it "redirects to the cat" do
        put :update, {:id => cat.to_param, :cat => valid_attributes}, valid_session
        expect(response).to redirect_to(cat)
      end
    end

    describe "with invalid params" do
      it "assigns the cat as @cat" do
        put :update, {:id => cat.to_param, :cat => invalid_attributes}, valid_session
        expect(assigns(:cat)).to eq(cat)
      end

      it "re-renders the 'edit' template" do
        put :update, {:id => cat.to_param, :cat => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested cat" do
      cat
      expect {
        delete :destroy, {:id => cat.to_param}, valid_session
      }.to change(Cat, :count).by(-1)
    end

    it "redirects to the cats list" do
      cat
      delete :destroy, {:id => cat.to_param}, valid_session
      expect(response).to redirect_to(cats_url)
    end
  end

end
