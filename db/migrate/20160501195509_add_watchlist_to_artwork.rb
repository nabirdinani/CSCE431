class AddWatchlistToArtwork < ActiveRecord::Migration
  def change
    add_column :artworks, :watchlist, :string
  end
end
