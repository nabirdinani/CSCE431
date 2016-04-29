class BidsController < ApplicationController
	

	def index
  		@bids = Bid.all
  		@arthistory = Array.new

  		@bids.each do |bid|
  			artid = bid.artwork_id
  			curr_art = Artwork.find(artid)
  		    @arthistory.push(curr_art)
  		end

  		
  	end

	def create
		@artwork = Artwork.find(params[:artwork_id])
		@bid = @artwork.bids.create(params[:bid].permit(:amount))
		@bid.user_id = session[:user_id]
		@bid.save!
		
		flash[:info] = "Your bid was submitted successfully!!"
		redirect_to artwork_bids_path(@artwork)
	end

end
