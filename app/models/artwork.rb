class Artwork < ActiveRecord::Base

	has_many :bids, dependent: :destroy
  	mount_uploader :attachment, AttachmentUploader 
  	validates :name, presence: true, length: { maximum: 50 } # Make sure the owner's name is present
  	validates :userid, presence: true
  	
  	
  	def self.all_approved_by_order(order)
        artworks=self.where(:approved=> true)
        
        
        bids =[]
        case order 
        when 'highest'
            artworks.each do |artwork|
                bid= Bid.where(:artwork_id=> artwork.id).order(amount: :desc).first
                bids << bid
            end
            
        when 'lowest'
            ordering = 'lowest'
        when 'recent'
            ordering = 'recent'
        else
            ordering = 'id'
            allartworks=artworks
        end
        
        return allartworks
  end

end
