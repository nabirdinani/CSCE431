require 'rails_helper'

RSpec.describe BidsController, type: :controller do


  before :each do
    @user = User.new(name: "Example User", phone: "9797397702", email: "user@example.com", password: "password", password_confirmation: "password")
    @user.save

    session[:user_id] = @user.id

    @artwork = Artwork.new(name: "Artwork1", userid: @user, autowinprice: 300)
    @artwork2 = Artwork.new(name: "Artwork1", userid: @user, autowinprice: 300)
    @artwork3 = Artwork.new(name: "Artwork1", userid: @user, autowinprice: 300, max_bid: 1000)
    @artwork4 = Artwork.new(name: "Artwork1", userid: @user, autowinprice: 1)

    @artwork.save
    @artwork2.save
    @artwork3.save
    @artwork4.save

    @bid = Bid.new(artwork_id: @artwork.id, amount: 12, user_id: @user.id)
    @bid.save
  end


  describe "GET #index" do
    it "returns http success" do
      get :index, {:artwork_id => @artwork}
      expect(response).to have_http_status(:success)
    end

    it "returns http redirect upon successful creation" do
      put :create, :artwork_id => @artwork, :bid => @bid.attributes
      expect(response).to have_http_status(:redirect)
    end

    it "returns http redirect upon failed creation" do
      put :create, :artwork_id => @artwork3, :bid => @bid.attributes
      expect(response).to have_http_status(:redirect)
    end

    it "returns http redirect upon failed creation" do
      put :create, :artwork_id => @artwork4.id, :bid => @bid.attributes
      expect(response).to have_http_status(:redirect)
    end
  end

end
