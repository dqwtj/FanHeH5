class CreateShings < ActiveRecord::Migration
  def self.up
    create_table :shings do |t|
      t.string :title
      t.string :gogo
      t.string :stop
      t.timestamps
    end
  end

  def self.down
    drop_table :shings
  end
end
