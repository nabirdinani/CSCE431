
class ArtworksController < ApplicationController
  def index
  	@artworks = Artwork.all
  end

  def new
  	@artwork = Artwork.new
  end

  def show
    @user = User.find(session[:user_id])
    @artwork = Artwork.find(params[:id])
    @expiretime = @artwork.expiretime.to_f * 1000
    @opentime = @artwork.opentime.to_f * 1000
    @timenow = (Time.now).to_f * 1000
   

    # for anonymous mode
    if @artwork.leadinguser == nil
      @anyone = false
    else
      @anyone = true
      @leadbidder = User.find(@artwork.leadinguser)
      @anon = @leadbidder.anon
    end

    # for watch/unwatch button
    @hash = Hash.new
    art = @artwork
    if art.watchlist != nil
      if art.watchlist.include? @user.id.to_s
        @hash[art.id] = true
      else
        @hash[art.id] = false
      end
    else
      @hash[art.id] = false
    end
  

  end

  def create
  	@artwork = Artwork.new(artwork_params)
    @artwork.userid = session[:user_id]
    @artwork.max_bid = 0
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
    # if @artwork.approved
    #   flash[:info] = "Sorry, this image has already been approved for auction. Contact Health4All to remove it."
    #   redirect_to url_for(:controller => :users, :action => :show, :id => session[:user_id])
    #   return
    # end

    if @artwork.destroy
      flash[:success] = "The picture #{@artwork.name} has been deleted."
      redirect_to url_for(:controller => :users, :action => :show, :id => session[:user_id])

      # we also need to delete all the bids that were associated with this piece
      @bids = Bid.all
      @bids.each do |bid|
        if bid.artwork_id.to_s == @artwork.id.to_s
          bid.destroy
        end
      end
    else
      flash[:danger] = "Something went wrong. We were unable to delete the image. Try again soon."
    end
  end

  private
    def artwork_params
    params.require(:artwork).permit(:name, :description, :attachment)
  end
end
