require 'rails_helper'

describe "Product", js: true do
  let(:product) { Product.create({name: 'iPhone 3G', price: 399, description: 'Sturdy', image_url: 'https://upload.wikimedia.org/wikipedia/commons/0/0b/IPhone_3G_rear.jpg'}) }

  context 'a user' do
    it 'can see the page title' do
      visit root_path
      expect(page).to have_content("Listing products")
    end
  end
end
