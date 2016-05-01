class BidsController < ApplicationController
	

	def index
  		@bids = Bid.where(:user_id => session[:user_id])
  		@art_items_bid_on = Array.new

  		@bids.each do |bid|
  			artid = bid.artwork_id
  			curr_art = Artwork.find(artid)
  		    @art_items_bid_on.push(curr_art)
  		end

  		@art_items_bid_on = @art_items_bid_on.uniq

  		@hash = Hash.new
  		@art_items_bid_on.each do |art|
  			array = Array.new
  			@bids.each do |bidd|
  				if bidd.artwork_id == art.id 
  					array.push(bidd)
  				end
  			end
  			@hash[art] = array
  		end
  		
  		
  	end

	def create
		@artwork = Artwork.find(params[:artwork_id])
		@bid = @artwork.bids.create(params[:bid].permit(:amount))
		@bid.user_id = session[:user_id]
		if @bid.save
		  flash[:info] = "Your bid was submitted successfully!"
    else 
      flash[:danger] = "Your bid could not be submitted. Try again soon."
    end
		
		redirect_to artwork_bids_path(@artwork)
	end

end
