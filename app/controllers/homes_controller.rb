class HomesController < ApplicationController
  def top
    @reviews = Review.all
    @previews = Preview.all
  end

  def about
  end
end
