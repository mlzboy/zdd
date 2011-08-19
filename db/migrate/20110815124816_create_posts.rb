class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.integer :quantity
      t.text :demand
      t.string :qq
      t.string :mobile
      t.text :contact
      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end
end
