class CategoriesController < ApplicationController

  def show
    @category = Category.find(params[:id])
    @products = @category.products.order(created_at: :desc)
  end

end


def index
  @category = Category.find(params[:id])
end

def show
  @product = Product.find params[:id]
end