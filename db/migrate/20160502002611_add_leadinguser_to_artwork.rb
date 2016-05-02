class AddLeadinguserToArtwork < ActiveRecord::Migration
  def change
    add_column :artworks, :leadinguser, :string
  end
end
