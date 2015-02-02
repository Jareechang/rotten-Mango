class ReviewsController < ApplicationController
  def new
    @movie = Movie.find(params[:movie_id])
    @review = @movie.reviews.build
  end

  def create
    @movie = Movie.find(params[:movie_id])
    @review = @movie.reviews.build(review_params)
  end
end
