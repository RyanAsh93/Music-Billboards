class BillboardsController < ApplicationController
  before_action :set_billboard, only: [:edit, :update, :show, :destroy]

  def index
    @billboards = Billboard.all
  end

  def show
    @artists = @billboard.artists
  end

  def create
    @billboard = Billboard.new(billboard_params)
    if (@billboard.save)
      redirect_to billboards_path
    else
      render :new
    end
  end

  def new
    @billboard = Billboard.new
  end

  def edit
    # @billboard = Billboard.find(params[:id])
  end

  def update
    if @billboard.update(billboard_params)
      redirect_to billboards_path
    else
      render :edit
  end
end

  def destroy
    @billboard.destroy
    redirect_to billboards_path
  end

  private

  def billboard_params
    params.require(:billboard).permit(:name)
  end

  def set_billboard
    @billboard = Billboard.find(params[:id])
  end
end
