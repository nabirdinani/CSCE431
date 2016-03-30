require 'simplecov'
SimpleCov.start

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  


  # before :each do
  # 	@user = User.new(name: "Example User", phone: "9797397702", email: "user@example.com", password: "password", password_confirmation: "password")
  # end

  # it 'email should be present' do 
  # 	@user.email = "     "
  # 	expect(@user).to_not be_valid
  # end
  # it "invalid signup information" do
  # 	get signup_path
  #   assert_no_difference 'User.count' do
  #     post users_path, user: { name:  "",
  #                              email: "user@invalid",
  #                              password:              "foo",
  #                              password_confirmation: "bar" }
  #   end
  #   render_template 'users/new'
  # end
	describe 'POST #create' do
		context 'with valid attributes' do  
		  it "creates a user and saves it" do
		  	post :create, user: {name: "Example User", phone: "9797397702", email: "user@example.com", password: "password", password_confirmation: "password"}
		  	expect(User.count).to eq(1)
		  	# response.should redirect_to users_path
		  	# response.success?
		  end

		  it 'redirects to the "show" action for the new user' do
		  	post :create, user: {name: "Example User", phone: "9797397702", email: "user@example.com", password: "password", password_confirmation: "password"}
		  	expect(response).to redirect_to User.first
		  	# response.should redirect_to users_path
		  	# response.success?
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

# do some cases for put - users controller
# do some cases for put/post -  sessions controller
#making database entities thing 


	# describe "GET #index" do
 #  		it "populates an array of contacts" do
 #    		user = user(name: nil, phone: "9797397702", email: "user@example.com", password: "password", password_confirmation: "password")
 #    		get :show
 #    		assigns(:user).should eq([user])
 #  		end
  
 #  		it "renders the :show view" do
 #    		get :show, 
 #    		response.should render_template :show
 #  		end
	# end




end


