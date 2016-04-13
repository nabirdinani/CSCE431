require 'simplecov'
SimpleCov.start

require 'rails_helper'

RSpec.describe ArtworksController, type: :controller do



  describe "GET" do

    before :each do
      @user = User.new(name: "Example User", phone: "9797397702", email: "user@example.com", password: "password", password_confirmation: "password")
    end

    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "returns index" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do

    before :each do
      @user = User.new(name: "Example User", phone: "9797397702", email: "user@example.com", password: "password", password_confirmation: "password")
      @user.activate
      allow_any_instance_of(ArtworksController).to receive(:logged_in?).and_return(true)
      #allow_any_instance_of(SessionController).to receive(:session[:user_id]).and_return(1)
      @request.session['user_id'] = '1'
    end

    context 'with valid attributes' do  
      it "creates an artwork and saves it" do
        post :create, artwork: {name: "Example User", description: "Hey, its a cool bra!!!", attachment: AttachmentUploader.new}
        expect(Artwork.count).to eq(1)
      end

      it "creates an artwork and deletes it" do
        post :create, artwork: {name: "Example User", description: "Hey, its a cool bra!!!", attachment: AttachmentUploader.new}
        expect(Artwork.count).to eq(1)
        post :destroy, :id => 1
        expect(Artwork.count).to eq(0)
      end

      it 'redirect to user upon successful create' do
        post :create, artwork: {name: "Example User", description: "Hey, its a cool bra!!!", attachment: AttachmentUploader.new}
        expect(response.body).to match("<a href=\"http://test.host/users/1\">redirected</a>")
        expect(Artwork.count).to eq(1)
      end
    end

    context 'with invalid attributes' do
      it 'does not create the artwork' do
        post :create, artwork: {name: " ", description: "Hey, its a cool bra!!!", attachment: AttachmentUploader.new}
        expect(Artwork.count).to eq(0)
      end
    end
  end
end
