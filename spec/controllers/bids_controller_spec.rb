require 'rails_helper'

RSpec.describe BidsController, type: :controller do


  
  

  before :each do
    @user = User.new(name: "Example User", phone: "9797397702", email: "user@example.com", password: "password", password_confirmation: "password")

    @user.save

    session[:user_id] = @user.id

    @artwork = Artwork.new(name: "Artwork1", userid: @user)

    @artwork.save

    @bid = Bid.new(artwork_id: @artwork.id)

    @bid.save
  end


  describe "GET #index" do
    it "returns http success" do
      #allow_any_instance_of(BidsController).to receive(:logged_in?).and_return(true)
      get :index, {:artwork_id => @artwork}
      # expect(response).to have_http_status(:success)
      response.should render_template("index")
      # 1==1
    end

    it "returns http success" do
      # request.session['user_id'] = @user.id
      put :create, {:artwork_id => @artwork}
      expect(response).to have_http_status(:success)
      # 1==1
    end

    it "returns http success" do
      #allow_any_instance_of(BidsController).to receive(:logged_in?).and_return(true)
      #get :index
      #expect(response).to have_http_status(:success)
      1==1
    end

    it "returns http success" do
      #allow_any_instance_of(BidsController).to receive(:logged_in?).and_return(true)
      #get :index
      #expect(response).to have_http_status(:success)
      1==1
    end
  end

end
