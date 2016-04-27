require 'simplecov'
SimpleCov.start

require 'rails_helper'
require 'spec_helper'

RSpec.describe BiddetailsController, type: :controller do
	describe "Get #index" do
		it "returns http success" do
			get :index
			expect(response).to have_http_status(:success)
		end

		it "Failed render when not logged in" do
			allow_any_instance_of(BiddetailsController).to receive(:logged_in?).and_return(false)
			get :index
		end
 	
 		it "Success render when logged in" do
 			allow_any_instance_of(BiddetailsController).to receive(:logged_in?).and_return(true)
 			get :index
 		end
 	end
end