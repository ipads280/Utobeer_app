class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!
  def index
    @genre=Genre.new
    @genres=Genre.all
  end

  def create
    @genre=Genre.new(genre_params)
    if @genre.valid?
      @genre.save
      redirect_to admin_genres_path, notice: "投稿しました"
    else
      @genres=Genre.all
      render :index
    end
  end
  
  def edit
    @genre=Genre.find(params[:id])
  end
  
  def update
    @genre=Genre.find(params[:id])
    if @genre.update(genre_params)
       redirect_to admin_genres_path, notice: "編集成功しました"
    else
      render :edit
    end
  end
  
  def destroy
    genre=Genre.find(params[:id])
    genre.destroy
    redirect_to admin_genres_path, notice: "削除しました"
  end
  
  private

  def genre_params
    params.require(:genre).permit(:genres_name)
  end
end
