class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :email
      t.string :full_name
      t.string :image
      t.string :location
      t.string :nickname
      t.string :urls

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
