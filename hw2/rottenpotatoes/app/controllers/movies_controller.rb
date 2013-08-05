class MoviesController < ApplicationController
  def show
    id = params[:id]
    @movie = Movie.find(id)
  end

  def index
    @all_ratings = Movie.select("DISTINCT rating")
    #debugger
    @col = params[:sort] ? params[:sort] : session[:sort]
    @selected_ratings = params['ratings'] ? params['ratings'] : session['rat']
    @selected_ratings = @selected_ratings ? @selected_ratings : {}
    if @col and @selected_ratings.any?
      @movies = Movie.all(:conditions => {:rating => @selected_ratings.keys}, :order => "#{@col} ASC")
    elsif @col and !@selected_ratings.any?
      @movies = Movie.all(:order => "#{@col} ASC")
    elsif !@col and @selected_ratings.any?
      @movies = Movie.all(:conditions => {:rating => @selected_ratings.keys})
    else
      @movies = Movie.all()
    end
    if params[:sort] != session[:sort] or params['ratings'] != session['rat']
      session[:sort] = params[:sort]
      session['rat'] = params['ratings']
      redirect_to :sort => @col, :ratings => @selected_ratings and return
    end
  end

  def new
  end

  def create
    @movie = Movie.create!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully created."
    flash.keep
    redirect_to movies_path(session['all'])
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully updated."
    flash.keep
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path(session['all'])
  end
end