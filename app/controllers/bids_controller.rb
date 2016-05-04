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
  			@hash[art] = array.reverse!
  		end
  		
  		
  end

  def is_user_watching(userid, artwork)
    @search_string = userid.to_s
    @list = artwork.watchlist
    if @list == nil
      return false
    else
      return @list.include? @search_string
    end
  end

	def create
    @user = User.find(session[:user_id])
		@artwork = Artwork.find(params[:artwork_id])
		@bid = @artwork.bids.create(params[:bid].permit(:amount))
		if @artwork.is_open_to_bid
		  if @artwork.startingprice < @bid.amount
        if @artwork.max_bid == nil 
          @artwork.max_bid = @bid.amount
        else
          if @artwork.max_bid >= @bid.amount
            # they just bid below the current price
            money1 = '%.2f' % @bid.amount
            money2 = '%.2f' % @artwork.max_bid
            flash[:danger] = "Your bid of $#{money1} was lower than the current highest bid of $#{money2}!"
            redirect_to artwork_path(@artwork)
            return
          else 
            @artwork.max_bid = @bid.amount
          end
        end
    
    
        if @artwork.autowinprice < @bid.amount
          flash[:danger] = "You tried to submit a bid that's past the autowin price. Are you sure you meant to do that? Use the 'Buy it now' button if you'd wish to purchase now!"
          redirect_to artwork_path(@artwork)
          return
        end
        @artwork.leadinguser = @user.id.to_s
        @artwork.save
    		@bid.user_id = session[:user_id]
    		if @bid.save
    		  flash[:info] = "Your bid was submitted successfully!"
          @prev_bids = Bid.where(:artwork_id => @artwork.id)
          if @prev_bids.size > 1 # someone else has been outbid
            
              @losing = User.find(@prev_bids[@prev_bids.size - 2].user_id)
              if is_user_watching(@losing.id, @artwork)
                @losing.send_outbid_notification_email(@artwork)
              end
          
          end
          if is_user_watching(@user.id, @artwork) 
            @user.send_bid_notification_email(@artwork, @bid)
          end
        else 
          flash[:danger] = "Your bid could not be submitted. Try again soon."
        end
      else
        flash[:danger]="Your bid is not above the minimum bid."
        redirect_to artwork_path(@artwork) and return
      end
    else
      flash[:danger] = "Artwork is no longer open to be bid on."
      redirect_to artwork_path(@artwork) and return
    end
		
		redirect_to artwork_bids_path(@artwork)
	end

end
