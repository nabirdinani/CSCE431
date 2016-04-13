require 'simplecov'
SimpleCov.start

require 'rails_helper'

RSpec.describe Artwork, type: :model do
  

  before :each do
  	@artwork = Artwork.new(name: "Example User", description: "Hey, its a cool bra!!!", attachment: AttachmentUploader.new, :userid => 1)
  end
  it 'should be valid' do 
  	expect(@artwork).to be_valid
  end

  it 'name should be present' do 
  	@artwork.name = "     "
  	expect(@artwork).to_not be_valid
  end

  it 'name should not be too long' do 
  	@artwork.name = "a" * 51
  	expect(@artwork).to_not be_valid
  end

  it 'only name is present' do 
  	@artwork.description = "     "
  	@artwork.attachment = nil
  	expect(@artwork).to be_valid
  end

  it 'name and attachment is present' do 
  	@artwork.description = "     "
  	expect(@artwork).to be_valid
  end

   it 'name and description is present' do 
  	@artwork.attachment = nil
  	expect(@artwork).to be_valid
  end

  it 'should be valid' do 
  	@artwork.name = "     "
  	@artwork.description = "     "
  	@artwork.attachment = nil
  	expect(@artwork).to_not be_valid
  end

  it 'should fail without a userid' do
    @artwork.userid = nil
    expect(@artwork).to_not be_valid
  end


end
