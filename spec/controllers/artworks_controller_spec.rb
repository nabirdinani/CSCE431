require 'simplecov'
SimpleCov.start

require 'rails_helper'

RSpec.describe ArtworksController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do  
      it "creates an artwork and saves it" do
        post :create, artwork: {name: "Example User", description: "Hey, its a cool bra!!!", attachment: AttachmentUploader.new}
        expect(Artwork.count).to eq(1)
        # response.should redirect_to users_path
        # response.success?
      end

      it 'redirects to the "show" action for the new artwork' do
        post :create, artwork: {name: "Example User", description: "Hey, its a cool bra!!!", attachment: AttachmentUploader.new}
        expect(response).to render_template :new
        # response.should redirect_to users_path
        # response.success?
      end
    end
    context 'with invalid attributes' do
      it 'does not create the artwork' do
        post :create, artwork: {name: " ", description: "Hey, its a cool bra!!!", attachment: AttachmentUploader.new}
        expect(Artwork.count).to eq(0)
      end

      it 're-renders the "new" view' do
        post :create, artwork: {name: "Example User", description: "Hey, its a cool bra!!!", attachment: AttachmentUploader.new}
        expect(response).to render_template :new
      end
    end
  end
end
