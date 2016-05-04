class PaymentController < ApplicationController
  def index
  	@artwork = Artwork.where(:won => true).where(:leadinguser.to_s => session[:user_id].to_s)
  end
end
