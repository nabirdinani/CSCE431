require 'rails_helper'

RSpec.describe LandingPageController, type: :controller do
	describe 'GET #home' do
	  	render_views
		context 'with valid attributes' do  
		  it 'has 200 status code when visiting' do
			get :home
			expect(response.status).to be 200
		  end

		  it "responds to html by default" do
		    get :home
		    expect(response.content_type).to eq "text/html"
		  end

		  it "displays the buttons" do
		  	get :home
		  	expect(response.body).to have_css("div.jumbotron")
		  end
		end
	end
end
