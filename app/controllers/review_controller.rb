class ReviewController < ApplicationController
  def index
  	@style = params[:view_style]
  	if (@style == nil) 
  		@style = "block"
  	end
  	if logged_in?
  	  @user = User.find(session[:user_id])
  	  @admin = @user.admin
  	else
  	  @admin = false
  	end

  	@artworks = Artwork.all
  end
end