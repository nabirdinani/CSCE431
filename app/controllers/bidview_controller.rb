class BidviewController < ApplicationController
  def index
  	@style = params[:view_style]
  	if (@style == nil) 
  		@style = "block"
  	end
  	if logged_in?
  		@user = User.find(session[:user_id])
  	end
  	@artworks = Artwork.all
  end
end
