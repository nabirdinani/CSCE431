class CreateArtworks < ActiveRecord::Migration
  def change
    create_table :artworks do |t|
      t.string :name
      t.string :description
      t.string :attachment

      t.timestamps null: false
    end
  end
end
