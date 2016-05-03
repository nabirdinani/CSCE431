class SettingsController < ApplicationController
  def show
      begin
        if logged_in?
        	@user = User.find(params[:id])
        end
      rescue ActiveRecord::RecordNotFound => e
        flash[:danger] = "Something went wrong! Sorry, try again."
        redirect_to root_url
      end
  end

  def update
  	if logged_in?
      begin
  		  @user = User.find(params[:id])
      rescue ActiveRecord::RecordNotFound => e
        flash[:danger] = "Something went wrong! Sorry, try again."
        redirect_to root_url
        return
      end
  		if @user.anon == nil
  			@flip = true
  		else
  			@flip = !@user.anon
  		end
  		redirect_to "/settings/#{@user.id}"
  		if @user.update_attribute(:anon, @flip)
  			flash[:success] = "Your anonymous mode has been changed!"
  		else
  			flash[:danger] = "Something went wrong! Sorry, try again."
  		end
  	end
  end
end
