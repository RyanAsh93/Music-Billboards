class SongsController < ApplicationController
  before_action :set_song, only: [:show, :destroy]

  def index
    @songss = Song.all
  end

  def show
  end

  def create
    @song = Song.new(song_params)
    if @song.save
      redirect_to songss_index_path
    else
      render :new
    end
  end

  def new
    @song = Song.new
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])
    if (@song.update(song_params))
      redirect_to songss_index_path
    else
      render :edit
  end
end

  def destroy
    @song.destroy
    redirect_to songss_index_path
  end

  private

  def song_params
    params.require(:song).permit(:name)
  end

  def set_song
    @song = Song.find(params[:id])
  end
end

