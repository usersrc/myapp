class StaticPagesController < ApplicationController
  def index
  end

  def landing_page
    @featured_product = Product.first
    @products = Product.limit(3)
  end

  def redirect_me
    redirect_to "/static_pages/landing_page"
  end
end
