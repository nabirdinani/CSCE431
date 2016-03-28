class ArtworksController < ApplicationController
  def index
  	@artworks = Artwork.all
  end

  def new
  	@artwork = Artwork.new
  end

  def create
  	@artwork = Artwork.new(artwork_params)
	if @artwork.save
      flash[:success] = "The picture #{@artwork.name} has been submitted."
      render 'new'
	else
	  flash[:danger] = "Picture was not uploaded."
      render "new"
	end
  end

  def destroy
  	@artwork = Artwork.find(params[:id])
    @artwork.destroy
    flash[:success] = "The picture #{@artwork.name} has been deleted."
    render 'new'
  end

  private
    def artwork_params
    params.require(:artwork).permit(:name, :description, :attachment)
  end
end
