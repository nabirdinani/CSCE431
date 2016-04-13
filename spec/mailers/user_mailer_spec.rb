require "rails_helper"

RSpec.describe UserMailer, type: :mailer do



  describe "account_activation" do

    before :each do
      @user = User.new(name: "Example User", phone: "9797397702", email: "user@example.com", password: "password", password_confirmation: "password")
      @user.activate
    end

    let(:mail) { UserMailer.account_activation(@user) }

    it "renders the headers" do
      expect(mail.subject).to eq("Account activation - Health4All")
      #expect(mail.to).to eq(["to@example.org"])
      #expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

  describe "password_reset" do

    before :each do
      @user = User.new(name: "Example User", phone: "9797397702", email: "user@example.com", password: "password", password_confirmation: "password")
    end

    let(:mail) { UserMailer.password_reset(@user) }

    it "renders the headers" do
      #expect(mail.subject).to eq("Password reset - Health4All")
    end

    it "renders the body" do
      #expect(mail.body.encoded).to match("Hi")
    end
  end

end
