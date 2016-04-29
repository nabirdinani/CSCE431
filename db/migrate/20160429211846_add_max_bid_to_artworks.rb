class AddMaxBidToArtworks < ActiveRecord::Migration
  def change
    add_column :artworks, :max_bid, :float
  end
end
