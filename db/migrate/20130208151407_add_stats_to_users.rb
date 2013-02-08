class AddStatsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :current_hp, :integer
    add_column :users, :max_hp, :integer
    add_column :users, :current_mana, :integer
    add_column :users, :max_mana, :integer
    add_column :users, :str, :integer
    add_column :users, :vit, :integer
    add_column :users, :dex, :integer
    add_column :users, :int, :integer
  end
end
