require 'rails_helper'
require 'shared_examples/standard_authorization'

RSpec.describe StoresController, :type => :controller do

  let(:admin_user) {login_with FactoryGirl.create(:admin)}
  let(:invalid_user) {login_with nil }

  let(:store) { FactoryGirl.create(:store) }
  let(:stores) { Store.all }
  let(:valid_attributes) { FactoryGirl.attributes_for(:store) }
  let(:invalid_attributes) { FactoryGirl.attributes_for(:store, name: nil) }

  # let(:valid_session) {login_with create(:admin)}
  # let(:invalid_session) {login_with nil }


  describe 'GET #index' do
    context 'when user is logged in' do
      before(:example) do
        admin_user
        get :index
      end
      it { is_expected.to respond_with :ok }
      it { is_expected.to render_template :index }
      it "assigns all stores as @stores" do
        expect(assigns(:stores)).to eq([store])
      end
    end

    context 'when user is logged out' do
      before(:example) do
        invalid_user
        get :index
      end
      it { is_expected.to redirect_to new_user_session_path }
    end
  end


  describe 'GET #show' do
    context 'when user is logged in' do
      before(:example) do
        admin_user
        get :show, {:id => store.to_param}
      end

      it { is_expected.to respond_with :ok }
      it { is_expected.to render_template :show }
      it "assigns the requested store as @store" do
        expect(assigns(:store)).to eq(store)
      end
    end

    context 'when user is logged out' do
      before(:example) do
        invalid_user
        get :show, {:id => store.to_param}
      end
      it { is_expected.to redirect_to new_user_session_path }
    end
  end


  describe 'GET #new' do
    context 'when user is logged in' do
      before(:example) do
        admin_user
        get :new
      end

      it { is_expected.to respond_with :ok }
      it { is_expected.to render_template :new }
      it "assigns the requested store as @store" do
        expect(assigns(:store)).to be_a_new(Store)
      end
    end

    context 'when user is logged out' do
      before(:example) do
        invalid_user
        get :new
      end
      it { is_expected.to redirect_to new_user_session_path }
    end
  end

  describe 'GET #edit' do
    context 'when user is logged in' do
      before(:example) do
        admin_user
        get :edit, {:id => store.to_param}
      end

      it { is_expected.to respond_with :ok }
      it { is_expected.to render_template :edit }
      it "assigns the requested store as @store" do
        expect(assigns(:store)).to eq(store)
      end
    end

    context 'when user is logged out' do
      before(:example) do
        invalid_user
        get :edit, {:id => store.to_param}
      end
      it { is_expected.to redirect_to new_user_session_path }
    end
  end


   describe "POST create" do
    describe "with valid params" do
      context 'when user is logged in' do
        before(:example) do
          admin_user
        end
      it "creates a new Store" do
        store
        expect {
          post :create, {:store => valid_attributes}
        }.to change(Store, :count).by(1)
      end

      it "assigns a newly created store as @store" do
        post :create, {:store => valid_attributes}
        expect(assigns(:store)).to be_a(Store)
        expect(assigns(:store)).to be_persisted
      end

      it "redirects to the created store" do
        post :create, {:store => valid_attributes}
        expect(response).to redirect_to(Store.last)
      end
    end
  end

    describe "with invalid params" do
      context 'when user is logged in' do
        before(:example) do
          admin_user
        end
      it "assigns a newly created but unsaved store as @store" do
        puts "invalid attributes: #{invalid_attributes}"
        post :create, {:store => invalid_attributes}
        expect(assigns(:store)).to be_a_new(Store)
      end

      it "re-renders the 'new' template" do
        post :create, {:store => invalid_attributes}
        expect(response).to render_template("new")
      end
    end
  end

    context 'when user is logged out' do
      before(:example) do
        invalid_user
        post :create, {:store => valid_attributes}
      end
        it { is_expected.to redirect_to new_user_session_path }
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      context 'when user is logged in' do
        before(:example) do
          admin_user
        end
          let(:new_attributes) { FactoryGirl.attributes_for(:store, name: "taco") }

          it "updates the requested store" do
            store
            put :update, {:id => store.to_param, :store => new_attributes}
            store.reload
          end

          it "assigns the requested store as @store" do
            store
            put :update, {:id => store.to_param, :store => valid_attributes}
            expect(assigns(:store)).to eq(store)
          end

          it "redirects to the store" do
            store
            put :update, {:id => store.to_param, :store => valid_attributes}
            expect(response).to redirect_to(store)
          end
      end
    end

    describe "with invalid params" do
      context 'when user is logged in' do
        before(:example) do
          admin_user
        end
          it "assigns the store as @store" do
            store
            put :update, {:id => store.to_param, :store => invalid_attributes}
            expect(assigns(:store)).to eq(store)
          end

          it "re-renders the 'edit' template" do
            store
            put :update, {:id => store.to_param, :store => invalid_attributes}
            expect(response).to render_template("edit")
          end
      end
    end

    context 'when user is logged out' do
      before(:example) do
        invalid_user
        store
        put :update, {:id => store.to_param, :store => invalid_attributes}
      end
        it { is_expected.to redirect_to new_user_session_path }
    end
  end

  describe "DELETE destroy" do
    context 'when user is logged in' do
        before(:example) do
          admin_user
        end
          it "destroys the requested store" do
            store
            expect {
              delete :destroy, {:id => store.to_param}
            }.to change(Store, :count).by(-1)
          end

          it "redirects to the stores list" do
            store = Store.create! valid_attributes
            delete :destroy, {:id => store.to_param}
            expect(response).to redirect_to(stores_url)
          end
    end

    context 'when user is logged out' do
      before(:example) do
        invalid_user
        store
        delete :destroy, {:id => store.to_param}
      end
        it { is_expected.to redirect_to new_user_session_path }
    end
  end

end #final ender