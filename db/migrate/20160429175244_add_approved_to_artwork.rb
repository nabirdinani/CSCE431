class AddApprovedToArtwork < ActiveRecord::Migration
  def change
    add_column :artworks, :approved, :boolean
  end
end
