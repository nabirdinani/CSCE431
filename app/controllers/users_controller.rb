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
      
<<<<<<< HEAD
      @sort = params[:sort_by]
      case @sort
        when 'highest'
          ordering = 'lowest'
        when 'lowest'
          ordering = 'lowest'
        when 'recent'
          ordering = 'recent'
        else
          ordering = 'id'
      end
      
      
      @artworksall = Artwork.all
  	  end
=======
      @artworksall = Artwork.where(:approved => true)
  	end 
>>>>>>> cc3718ed399a10e0069649fc673574aa583bbf45

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

  	private

  	def user_params
      params.require(:user).permit(:name, :phone, :email, :password,
                                   :password_confirmation)
    end

end
