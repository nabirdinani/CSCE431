require 'simplecov'
SimpleCov.start

require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

	describe "GET #new" do
		it "returns http success" do
			get :new	
			expect(response).to have_http_status(:success)
		end
	end

	describe 'POST #create' do
		context 'with valid attributes' do  
		  it "creates a new session and redirects to the home page" do
		  	post :create, session: {email: "nabirdinani1@gmail.com", password: "yourmom123"}
		  	expect(response).to render_template :new
		  end
		end
		context 'with invalid attributes' do
      		it 'does not create the session' do
       			post :create, session: {email: "   ", password: "yourmom123"}
		  		expect(response).to render_template :new
      		end
    	end
	end
end
