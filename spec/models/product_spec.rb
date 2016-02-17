require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:valid) {
    Product.new({name: 'iPhone 3G', price: 399, description: 'Sturdy'})
  }

  let(:blank) {
    Product.new({name: '', price: nil, description: ''})
  }

  let(:negative_price) {
    Product.new({name: 'iPhone 3G', price: -100, description: 'Sturdy'})
  }

  describe "product validations" do
    context "will create an error" do
      it "when fields are empty" do
        blank.save
        expect(blank.errors[:name]).to include("can't be blank")
        expect(blank.errors[:description]).to include("can't be blank")
        expect(blank.errors[:price]).to include("can't be blank")
      end
      it "the price is negative" do
        negative_price.save
        expect(negative_price.errors[:price]).to include("must be greater than 0")
      end
    end
    it 'saves with valid data' do
      expect{valid.save}.to change{Product.count}.by(1)
    end
  end
end
