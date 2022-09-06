class Admin::DashboardController < ApplicationController
  def show
    #count of how many products are in the database
    #count of how many categories are in the database
    @product_count = Product.count(:id)
    @category_count = Category.count(:id)
  end
end
