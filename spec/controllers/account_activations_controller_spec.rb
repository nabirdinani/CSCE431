require 'simplecov'
SimpleCov.start

require 'rails_helper'

RSpec.describe AccountActivationsController, type: :controller do

  describe 'get #edit' do

    before :each do
      @user = User.new(name: "Example User", phone: "9797397702", email: "user@example.com", password: "password", password_confirmation: "password", activation_token: "BABABAA")
    end

    it "returns http success" do
      get :edit, id: "randomtoken", email: @user.email
      expect(response).to have_http_status(:redirect)
    end

    it "does not activate with invalid token" do
      get :edit, id: "invalid", email: @user.email
      expect(@user.activated?).to be(false)
      expect(session[:user_id]).to be(nil)
    end

    it "does not activate with valid token and invalid email" do
      get :edit, id: "", email: "bad"
      expect(@user.activated?).to be(false)
      expect(session[:user_id]).to be(nil)
    end

    it "Activates user with valid token and valid email" do
      get :edit, id: @user.activation_token, email: @user.email
      expect(session[:user_id]).to eq(@user.id)
      expect(@user.activated?)
    end

    it "Blocks already activated user" do
      @user.activate
      get :edit, id: @user.activation_token, email: @user.email
      expect(session[:user_id]).to be(nil) #no login
      expect(@user.activated?) #still activated
    end

  end
end
