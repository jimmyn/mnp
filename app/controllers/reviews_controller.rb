class ReviewsController < ApplicationController

  def index
    @reviews = Review.page(params[:page])
  end

end
