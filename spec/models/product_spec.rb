require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    before do
      @category = Category.new(id: 1, name: "Bonsai")
      @product = Product.new(id: 1, name:"Azalea", price_cents: 5231, quantity: 5, category: @category)
    end

    it "should have valid attributes" do
      expect(@product).to be_valid
    end

    it "should have a valid product name" do
      @product.name = nil
      @product.valid?
      expect(@product.errors.full_messages).to_not be_empty
    end

    it "should have a valid price" do
      @product.price_cents = nil
      @product.valid?
      expect(@product.errors.full_messages).to_not be_empty
    end

    it "should have a valid quantity" do
      @product.quantity = nil
      @product.valid?
      expect(@product.errors.full_messages).to_not be_empty
    end

    it "should have a valid category" do
      @product.category = nil
      @product.valid?
      expect(@product.errors.full_messages).to_not be_empty
    end
  end
end
