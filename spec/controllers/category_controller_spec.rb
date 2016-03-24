require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do

  admin = User.create(username: "tim",email: "tim@tim.com",password: "timtim" ,admin: true )


  before :each do
    sign_in admin
  end
  
  describe 'GET #new' do 
    it 'assigns a new category to @category' do 
      get :new
      expect(assigns(:category)).to be_a_new(category)
    end

    it 'renders the :new template' do 
      get :new
      expect(response).to render_template :new
    end
  end
  describe 'POST #create' do 
    let(:category) {Category.create!(name: Faker::Beer.name) }
    it 'assigns the requested category to @category' do 
      get :edit, id: category.id
      expect(assigns(:category)).to eq category
    end

    it 'renders adds a new category to the list of products' do 
      get :edit, id: category.id
      expect(Category.all).to include(category)
    end
  end
  describe 'GET #edit' do 
    let(:category) {Category.create!(name: Faker::Beer.name) }
    it 'assigns the requested category to @category' do 
      get :edit, id: category.id
      expect(assigns(:category)).to eq category
    end

    it 'renders the :edit template' do 
      get :edit, id: category.id
      expect(response).to render_template :edit
    end
  end
  describe 'PUT #update' do 
    let(:category) {Category.create!(name: "pie beer") }
    it "changes @category's attributes" do
      category.update_attributes(name: "billy bob beer")
      expect(category.name).to eq("billy bob beer")
    end
  end
end