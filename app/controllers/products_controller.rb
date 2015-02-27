class ProductsController < ApplicationController

  before_action :set_categories

  def index
    @products = Product.text_search(params[:query]).in_category(params[:category]).in_price_range(params[:min], params[:max]).page(params[:page])
  end

  def show
    @product = Product.find(params[:id])
  end

  def set_categories
    @categories = Category.includes(:products)
  end

end
