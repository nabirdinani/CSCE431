require 'simplecov'
SimpleCov.start

require 'rails_helper'
require 'spec_helper'

RSpec.describe PasswordResetsController, type: :controller do	

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to be_success
    end
  end

  describe "GET edit" do
    it "base test" do
      get :edit
      expect(response).to be_redirect
    end
  end

  describe "POST create" do

    before :each do
      @user = User.new(name: "Example User", phone: "9797397702", email: "example@moc.com", password: "password", password_confirmation: "password", activation_token: "BABABAA")
    end

    it "success post create" do
      post :create, password_reset: {email: "example@moc.com"}
      expect(response).to be_success
      @user.create_reset_digest
      expect(@user.reset_digest).to_not be nil
    end

    it "check if activation token is set" do
      expect(@user.reset_digest).to be nil
      post :create, password_reset: {email: "example@moc.com"}
      expect(response).to be_success
      @user.create_reset_digest
      expect(@user.reset_digest).to_not be nil
    end
  end

  describe "POST update" do

    it "failed update password" do
      1==1
    end

    it "check if activation token is set" do
      1==1
    end
  end



end
