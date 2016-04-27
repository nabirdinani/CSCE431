require 'simplecov'
SimpleCov.start

require 'rails_helper'
require 'spec_helper'

RSpec.describe BidviewController, type: :controller do	

  describe 'GET #index' do
  	render_views
	context 'with valid attributes' do  
	  it 'has 200 status code when visiting' do
		get :index
		expect(response.status).to be 200
	  end

	  it "responds to html by default" do
	    get :index
	    expect(response.content_type).to eq "text/html"
	  end

      it "Failed render when not logged in" do
      	allow_any_instance_of(BidviewController).to receive(:logged_in?).and_return(false)
        get :index
        expect(response.body).to match('You must login to view this page.')
      end

      # it "Success render when logged in" do
      # 	allow_any_instance_of(BidviewController).to receive(:logged_in?).and_return(true)
      #   get :index
      #  # expect(response.body).to match('Hello')
      # end

      # it "Block view upon default render when logged in" do
      # 	allow_any_instance_of(BidviewController).to receive(:logged_in?).and_return(true)
      #   get :index
      #  # expect(response.body).to match('Hello')
      #  # expect(response.body).to have_css('div.block-view')
      # end

      # it "Line view upon request render when logged in" do
      # 	allow_any_instance_of(BidviewController).to receive(:logged_in?).and_return(true)
      #   get :index, :view_style => "line"
      #  # expect(response.body).to match('Hello')
      #  # expect(response.body).to have_css('div.line-view')
      # end

    end
  end


end
