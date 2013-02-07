class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :slug
      t.integer :level
      t.datetime :last_level_up
      t.datetime :next_level_up

      t.timestamps
    end
  end
end
