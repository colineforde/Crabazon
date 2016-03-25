require 'rails_helper'

RSpec.describe ProductsController, type: :controller do

  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:admin]
    admin = FactoryGirl.create(:admin)
    sign_in :user, admin # sign_in(scope, resource)
    @category = Category.create(name: "test_category")
    @product = @category.products.create!(name: "testing1", description: "testing description", price: 100, quantity: 10)
  end
  
  describe 'GET #new' do 
    it 'assigns a new Products to @Products' do 
      get :new
      expect(assigns(:product)).to be_a_new(Product)
    end

    it 'renders the :new template' do 
      get :new
      expect(response).to render_template :new
    end
  end
  describe 'POST #create' do 
    it 'create creates a new Products' do
      before_count = Product.count
      @new_product = Product.create(name: "new_testing", description: "testing description 2", price: 10, quantity: 20)
      expect(Product.count).to_not eq(before_count)
    end
  end


  describe 'GET #edit' do 
     it "assigns the requested Products to @Products" do
      get :edit, category_id: @category, id: @product
      expect(assigns(:product)).to eq @product
    end
    it 'renders the :edit template' do 
      get :edit, category_id: @category, id: @product
      expect(response).to render_template :edit
    end
  end

  describe 'PUT #update' do 
    it "changes @Products's attributes" do
      test1 = Product.create(name: "test1")
      test1.update_attributes(name: "test1_update")
      expect(test1.name).to eq("test1_update")
    end
  end


  describe 'DELETE #destroy' do
    it 'deletes the Products from the database' do
      expect{
        delete :destroy, category_id: @category, id: @product
      }.to change(Product, :count).by(-1)
    end

    it 'redirects to Products#index' do
      delete :destroy, category_id: @category, id: @product
      expect(response).to redirect_to admin_index_path
    end
  end


end