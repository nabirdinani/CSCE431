class AddAnonToUser < ActiveRecord::Migration
  def change
    add_column :users, :anon, :boolean
  end
end
