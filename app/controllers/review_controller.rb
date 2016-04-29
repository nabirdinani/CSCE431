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

    @artworks = Artwork.where(:approved => nil)
  end

  def update
    if logged_in?
      begin
        @user = User.find(session[:user_id])
        if @user.admin
          @id = params[:id]
          @artwork = Artwork.find(@id)
          @artwork.startingprice = params[:startingprice]
          @artwork.autowinprice = params[:autowinprice]
          @artwork.approved = true
          if @artwork.save!
            flash[:info] = "Artwork approved!"
            redirect_to review_index_path
          else
            flash[:info] = "Artwork was not updated"
          end
        end
      rescue ActiveRecord::RecordNotFound => e
        
      end
    end
  end

  def show

  end




end
