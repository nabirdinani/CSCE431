class WatchController < ApplicationController
  def index
  end

  def show
  	@user = User.find(session[:user_id])
  	@userid = @user.id

  	@artwork = Artwork.find(params[:id])
  	@artworkid = @artwork.id
  	@alert = String.new
  	@new_list = String.new
  	if @artwork.watchlist == nil
  		# artwork has never been watched! safely add user to watchlist
  		@new_list = ""
  		@new_list << (@userid.to_s) << ' '
  		@alert = "You will now receive notifications for this item."
  	else
  		# the artwork has previously been watched
  		# load into array
  		@new_list = @artwork.watchlist

  		arr = @new_list.split(' ')
  		already_watching = false
  		arr.each do |uid|
  		  puts uid + " " + @userid.to_s
	      if uid == @userid.to_s
	      	already_watching = true
	      	# he was already watching it, we need to unwatch
	      	remove = (@userid.to_s) + ' '
	      	@new_list.slice! remove
	      	@alert = "You will no longer receive notifications for this item."
		  end
		end


		if !already_watching
			# he was not watching it previously, add to the watchlist
			@alert = 'You will now receive notifications for this item.'
			@new_list << (@userid.to_s) << ' '
		end

	end


  	if @artwork.update_attributes!(:watchlist => @new_list)
  		flash[:success] = @alert
  	else
  		flash[:danger] = "Could not watch this item. Try again soon."
  end

  redirect_to "/users/#{@userid}"


  end
end
