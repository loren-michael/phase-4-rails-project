class MoviesController < ApplicationController

  def index
    render json: Movie.all
  end

  def create
    movie = @current_user.movies.create!(movie_params)
    render json: movie, status: :created
  end

  def show
    find_movie
    render json: @movie
  end

  def destroy
    find_movie
    @movie.destroy
    render json: { message: "Movie has been removed"}, status: :accepted
  end

  private

    def find_movie
      @movie = Movie.find_by(id: params[:id])
    end

    def movie_params
      params.permit(:title, :mpaa, :poster_url, :year, :runtime, :synopsis, :availability, :store_id)
    end
end
