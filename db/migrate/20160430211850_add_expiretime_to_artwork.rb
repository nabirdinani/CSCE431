class AddExpiretimeToArtwork < ActiveRecord::Migration
  def change
    add_column :artworks, :expiretime, :datetime
  end
end
