class ReviewController < ApplicationController

  attr_accessor :admin


  def index
  	@style = params[:view_style]
  	if (@style == nil) 
  		@style = "block"
  	end
  	if logged_in?
  	  begin
        @user = User.find(session[:user_id])
        @admin = @user.admin
      rescue ActiveRecord::RecordNotFound => e
        @user = User.create(:name => "Nil", :email => "nil@nil.edu", :password => "nil", :phone => "nil", :admin => false)
      end
      @admin = @user.admin
  	else
  	  @admin = false
  	end

  	@artworks = Artwork.all
  end




end
