class MoviesController < ApplicationController
  def index
    @movies = movie_search(params)
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new 
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def create 
    @movie = Movie.new(movie_params)
    if @movie.save 
      redirect_to movies_path, notice: "#{@movie.title} was submitted succeesfully!"
    else
      render :new 
    end
  end

  def update 
    @movie = Movie.find(params[:id])

    if @movie.update_attributes(movie_params)
      redirect_to movies_path 
    else
      render :edit
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path
  end

  protected 
  def movie_params 
    params.require(:movie).permit(:title, 
                  :release_date,
                  :director, 
                  :runtime_in_minutes,
                  :poster_image_url,
                  :description,
                  :image)
  end

  def movie_search(params)
    movie = Movie.all
    movie = movie.where("title LIKE ?", "%" + params[:title] + "%") if params[:title]
    movie = movie.where("director LIKE ?", "%" + params[:director]+ "%") if params[:director]
    if params[:runtime]
      case params[:runtime]
      when "1"
         movie = movie.where("runtime_in_minutes <=", 90 ) 
      when "2"
         movie = movie.where("runtime_in_minutes >= ? AND runtime_in_minutes <=", 90, 120) 
      when "3" 
         movie = movie.where("runtime_in_minutes >=", 120 ) 
      end
    end
    movie
  end
end


