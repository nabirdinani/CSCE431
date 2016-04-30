class AddOpentimeToArtwork < ActiveRecord::Migration
  def change
    add_column :artworks, :opentime, :datetime
  end
end
