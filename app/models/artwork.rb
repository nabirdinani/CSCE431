class Artwork < ActiveRecord::Base
  mount_uploader :attachment, AttachmentUploader 
  validates :name, presence: true # Make sure the owner's name is present
end
