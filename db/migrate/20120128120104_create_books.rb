class CreateBooks < ActiveRecord::Migration
  def self.up
    create_table :books do |t|
      t.string :asin, :unique => true
      t.integer :bookmarks_count, :default => 0 

      t.timestamps
    end
  end

  def self.down
    drop_table :books
  end
end
