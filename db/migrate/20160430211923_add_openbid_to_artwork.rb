class AddOpenbidToArtwork < ActiveRecord::Migration
  def change
    add_column :artworks, :openbid, :boolean
  end
end
