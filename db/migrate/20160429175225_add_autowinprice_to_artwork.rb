class AddAutowinpriceToArtwork < ActiveRecord::Migration
  def change
    add_column :artworks, :autowinprice, :float
  end
end
