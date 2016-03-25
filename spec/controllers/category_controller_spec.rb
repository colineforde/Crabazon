require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do

  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:admin]
    admin = FactoryGirl.create(:admin)
    sign_in :user, admin # sign_in(scope, resource)
    @category = Category.create!(name: Faker::Beer.name)
  end
  
  describe 'GET #new' do 
    it 'assigns a new category to @category' do 
      get :new
      expect(assigns(:category)).to be_a_new(Category)
    end

    it 'renders the :new template' do 
      get :new
      expect(response).to render_template :new
    end
  end
  describe 'POST #create' do 
    it 'create creates a new category' do
      before_count = Category.count
      @new_category = Category.create(name: "hey")
      expect(Category.count).to_not eq(before_count)
    end
  end


  describe 'GET #edit' do 
     it "assigns the requested category to @category" do
      get :edit, id: @category
      expect(assigns(:category)).to eq @category
    end
    it 'renders the :edit template' do 
      get :edit, id: @category
      expect(response).to render_template :edit
    end
  end

  describe 'PUT #update' do 
    it "changes @category's attributes" do
      test1 = Category.create(name: "test1")
      test1.update_attributes(name: "test1_update")
      expect(test1.name).to eq("test1_update")
    end
  end


  describe 'DELETE #destroy' do
    it 'deletes the category from the database' do
      expect{
        delete :destroy, id: @category
      }.to change(Category, :count).by(-1)
    end

    it 'redirects to categories#index' do
      delete :destroy, id: @category
      expect(response).to redirect_to admin_index_path
    end
  end


end