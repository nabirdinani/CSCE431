class Artwork < ActiveRecord::Base

	has_many :bids, dependent: :destroy
  	mount_uploader :attachment, AttachmentUploader 
  	validates :name, presence: true, length: { maximum: 50 } # Make sure the owner's name is present
  	validates :userid, presence: true
  	


    def is_open_to_bid
        @now =Time.zone.now.to_s(:db)
        (@now < self.expiretime) && (@now >self.opentime)
    end
end
