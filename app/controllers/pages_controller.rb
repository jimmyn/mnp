class PagesController < ApplicationController
  def index
    @products = Product.includes(:product_images).featured
  end
end
