class AddColumnToPosts < ActiveRecord::Migration
  def self.up
    add_column :posts, :lost_id, :integer
    add_column :posts, :have_id, :integer
  end

  def self.down
    remove_column :posts, :have_id
    remove_column :posts, :lost_id
  end
end
