class AddWonToArtwork < ActiveRecord::Migration
  def change
    add_column :artworks, :won, :boolean
  end
end
