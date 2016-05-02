class UsersController < ApplicationController

  

	  def show
    	if logged_in?
          begin
            @user = User.find(session[:user_id])
          rescue ActiveRecord::RecordNotFound => e
            @user = User.create(:name => "Nil", :email => "nil@nil.edu", :password => "nil", :phone => "nil")
          end
          @active = true
      end

      @artworks = Artwork.where(:userid => session[:user_id])

      @style = params[:view_style]
      if (@style == nil) 
        @style = "block"
      end
      
      @sort = params[:sort_by]
      case @sort
        when 'highest'
          @artworksall = Artwork.where(:approved => true).order(max_bid: :desc)
        when 'lowest'
          @artworksall = Artwork.where(:approved => true).order(max_bid: :asc)
        when 'highestBN'
          @artworksall = Artwork.where(:approved => true).order(autowinprice: :desc)
        when 'lowestBN'
          @artworksall = Artwork.where(:approved => true).order(autowinprice: :asc)
        when 'recent'
          @artworksall = Artwork.where(:approved => true).order(created_at: :desc)
        else
          @artworksall = Artwork.where(:approved => true)
      end

      @hash = Hash.new
      @artworks.each do |art|
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
      

      
  	end 

  	def new
    	@user = User.new
  	end

  	def create
    	@user = User.new(user_params)
    	if @user.save
        @user.send_activation_email
        flash[:info] = "Please check your email to activate your account."
        redirect_to root_url
	    else
      		render 'new'
    	end
  	end

    def give_time
      @time = Time.now.utc.to_s.split(" ").second
      render :partial => 'shared/time_portion'
    end

  	private

  	def user_params
      params.require(:user).permit(:name, :phone, :email, :password,
                                   :password_confirmation)
    end
    
end

