class BiddetailsController < ApplicationController
  def index
  	@artwork = Artwork.first
  end
end
