class AddUseridToArtwork < ActiveRecord::Migration
  def change
    add_column :artworks, :userid, :string
  end
end
