class BidviewController < ApplicationController
  

  def index
  	@style = params[:view_style]
  	if (@style == nil) 
  		@style = "block"
  	end
  	if logged_in?
      begin
        @user = User.find(session[:user_id])
      rescue ActiveRecord::RecordNotFound => e
        @user = User.create(:name => "Nil", :email => "nil@nil.edu", :password => "nil", :phone => "nil")
      end
        @active = true
  	end
  	@artworks = Artwork.all
  end

end
