class BidsController < ApplicationController
	

	def index
  		@artwork = Artwork.all
  	end

	def create
		@artwork = Artwork.find(params[:artwork_id])
		@bid = @artwork.bids.create(params[:bid].permit(:amount))
		@bid.user_id = session[:user_id]
		@bid.save!
		
		flash[:info] = "Your bid was submitted successfully!!"
		redirect_to artwork_path(@artwork)
	end

end
