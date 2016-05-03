require 'rails_helper'

RSpec.describe SettingsController, type: :controller do

  describe "GET #show" do
  	render_views 
    it "returns http redirect with not logged in" do
      get :show, :id => 1
      expect(response).to have_http_status(:success)
    end

    it "returns http success" do
      allow_any_instance_of(SettingsController).to receive(:logged_in?).and_return(true)
      get :show, :id => 1
      expect(response).to have_http_status(:redirect)
    end

    it "reeturns success on update" do
      allow_any_instance_of(SettingsController).to receive(:logged_in?).and_return(true)
      put :update, :id => 1
      expect(response).to have_http_status(:redirect)
    end
  end

end
