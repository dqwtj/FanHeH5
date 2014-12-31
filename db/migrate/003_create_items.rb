class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.integer :yday
      t.integer :go1
      t.integer :go2
      t.integer :stop1
      t.integer :stop2
      t.timestamps
    end
  end

  def self.down
    drop_table :items
  end
end
