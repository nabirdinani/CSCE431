require 'simplecov'
SimpleCov.start

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
 
	describe 'POST #create' do
		context 'with valid attributes' do  
		  it "creates a user and saves it" do
		  	post :create, user: {name: "Example User", phone: "9797397702", email: "user@example.com", password: "password", password_confirmation: "password"}
        expect(User.count).to eq(1)
		  end

		  it 'redirects to the "show" action for the new user' do
		  	post :create, user: {name: "Example User", phone: "9797397702", email: "user@example.com", password: "password", password_confirmation: "password"}
		  	expect(response).to redirect_to root_url
		  end
		end
		context 'with invalid attributes' do
      		it 'does not create the user' do
       		post :create, user: {name: nil, phone: "9797397702", email: "user@example.com", password: "password", password_confirmation: "password"}
        	expect(User.count).to eq(0)
      		end

      		it 're-renders the "new" view' do
       	 		post :create, user: {name: nil, phone: "9797397702", email: "user@example.com", password: "password", password_confirmation: "password"}
       			expect(response).to render_template :new
      		end
    	end
	end

end


