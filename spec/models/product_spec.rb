require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
   it 'ensures that a product with all four fields set will save' do
    @category = Category.create(name:"Pelican")
    product = Product.new(
      name: "Roger",
      price: 34,
      quantity: 2,
      category: @category
    )
    expect(product).to (be_valid)
    end

  it 'ensures the product has a name' do
    @category = Category.create(name:"Pelican")
    product = Product.new(
      name: nil,
      price: 34,
      quantity: 2,
      category: @category
    )
    expect(product).to_not (be_valid)
    end

    it 'ensures the product has a price' do
      @category = Category.create(name:"Pelican")
      product = Product.new(
        name: "Roger",
        quantity: 2,
        category: @category
      )
      expect(product).to_not (be_valid)
      end

      it 'ensures the product has a quantity' do
        @category = Category.create(name:"Pelican")
        product = Product.new(
          name: "Roger",
          price: 34,
          quantity: nil,
          category: @category
        )
        expect(product).to_not (be_valid)
        end

        it 'ensures the product has a category' do
          @category = Category.create(name:"Pelican")
          product = Product.new(
            name: "Roger",
            price: 34,
            quantity: 15,
            category: nil
          )
          expect(product).to_not (be_valid)
          end
  end
end
