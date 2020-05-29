class ArtistsController < ApplicationController
  before_action :set_billboard
  before_action :set_artist, only: [:show, :edit, :destroy, :update]

  def index
    @artists = @billboard.artists
  end

  def show
  end

  def create
    @artist = @billboard.artists.new(artist_params)

    if (@artist.save)
      redirect_to billboard_path(@billboard)
    else
      render :new
    end
  end

  def new
    @artist = @billboard.artists.new
    
  end

  def edit
    # @artist = Artist.find(params[:id])
  end

  def update
    if @artist.update(artist_params)
      redirect_to artists_path
    else
      render :edit
  end
end

  def destroy
    @artist.destroy
    redirect_to artists_path
  end

  private

  def artist_params
    params.require(:artist).permit(:name)
  end

  def set_artist
    @artist = Artist.find(params[:id])
  end

  def set_billboard
    @billboard = Billboard.find(params[:billboard_id])
  end

end
     