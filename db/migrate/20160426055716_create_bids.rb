class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.integer :amount
      t.references :user, index: true, foreign_key: true
      t.references :artwork, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
