class UsersController < ApplicationController

  

	 def show
    	@user = User.find(params[:id])
      @artworks = Artwork.all
  	end 

  	def new
    	@user = User.new
  	end

  	def create
    	@user = User.new(user_params)
    	if @user.save
        log_in @user
        flash[:success] = "Welcome, User!"
		    redirect_to @user
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
