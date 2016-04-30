
class ArtworksController < ApplicationController
  def index
  	@artworks = Artwork.all
  end

  def new
  	@artwork = Artwork.new
  end

  def show
    @artwork = Artwork.find(params[:id])
    @time = (1.hour.from_now).to_f * 1000
  end

  def create
  	@artwork = Artwork.new(artwork_params)
    @artwork.userid = session[:user_id]
	  if @artwork.save
      flash[:success] = "The picture #{@artwork.name} has been submitted."
      redirect_to url_for(:controller => :users, :action => :show, :id => session[:user_id])
	  else
	    flash[:danger] = "Picture was not uploaded."
      redirect_to url_for(:controller => :users, :action => :show, :id => session[:user_id])
	  end
  end

  def destroy
  	@artwork = Artwork.find(params[:id])
    @artwork.destroy
    flash[:success] = "The picture #{@artwork.name} has been deleted."
    redirect_to url_for(:controller => :users, :action => :show, :id => session[:user_id])
  end

  private
    def artwork_params
    params.require(:artwork).permit(:name, :description, :attachment)
  end
end
