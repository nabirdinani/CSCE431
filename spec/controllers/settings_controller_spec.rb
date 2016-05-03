require 'rails_helper'

RSpec.describe SettingsController, type: :controller do


  before :each do
    @user = User.new(name: "Example User", phone: "9797397702", email: "user@example.com", password: "password", password_confirmation: "password")

    @user.save

    session[:user_id] = @user.id

    @artwork = Artwork.new(name: "Artwork1", userid: @user)

    @artwork.save

    @bid = Bid.new(artwork_id: @artwork.id)

    @bid.save
  end

  describe "GET #show" do
  	render_views 
    it "returns http redirect with not logged in" do
      get :show, :id => @user.id
      expect(response).to have_http_status(:success)
    end

    it "returns http success" do
      allow_any_instance_of(SettingsController).to receive(:logged_in?).and_return(true)
      get :show, :id => @user.id
      expect(response).to have_http_status(:redirect)
    end

    it "reeturns success on update" do
      allow_any_instance_of(SettingsController).to receive(:logged_in?).and_return(true)
      put :update, :id => @user.id
      expect(response).to have_http_status(:redirect)
    end
  end

end
