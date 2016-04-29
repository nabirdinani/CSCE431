class AddStartingpriceToArtwork < ActiveRecord::Migration
  def change
    add_column :artworks, :startingprice, :float
  end
end
