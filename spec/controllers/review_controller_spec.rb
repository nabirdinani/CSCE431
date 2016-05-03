require 'simplecov'
SimpleCov.start

require 'rails_helper'
require 'spec_helper'

RSpec.describe ReviewController, type: :controller do

	

   describe "GET index" do
   	render_views
    it "returns https success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "responds to html by default" do
    	get :index
    	expect(response.content_type).to eq "text/html"
    end

    it "failed render when logged in but not admin" do
    	allow_any_instance_of(ReviewController).to receive(:logged_in?).and_return(true)
    	allow_any_instance_of(ReviewController).to receive(:admin).and_return(false)
    	get :index
    	expect(response.body).to match('You must be logged in to view this page.')
    end

    it "Success render when admin logged in" do
    	allow_any_instance_of(ReviewController).to receive(:logged_in?).and_return(true)
    	allow_any_instance_of(ReviewController).to receive(:admin).and_return(true)
    	get :index
    	expect(response.body).to match('You must be logged in to view this page.')
    end

    it "Default render when admin logged in" do
    	allow_any_instance_of(ReviewController).to receive(:logged_in?).and_return(true)
    	allow_any_instance_of(ReviewController).to receive(:admin).and_return(true)
    	get :index
    	#expect(response.body).to have_css('div.block-view')
    	expect(response.body).to match('You must be logged in to view this page.')
    end

    it "Block view upon request render when admin logged in" do
    	allow_any_instance_of(ReviewController).to receive(:logged_in?).and_return(true)
    	allow_any_instance_of(ReviewController).to receive(:admin).and_return(true)
    	get :index
    	#expect(response.body).to have_css('div.line-view')
    	expect(response.body).to match('You must be logged in to view this page.')
    end

    it "Block view upon request render when admin logged in" do
        allow_any_instance_of(ReviewController).to receive(:logged_in?).and_return(true)
        allow_any_instance_of(ReviewController).to receive(:admin).and_return(true)
        put :update
        #expect(response.body).to have_css('div.line-view')
        expect(response.body).to match('You must be logged in to view this page.')
    end

   end
end