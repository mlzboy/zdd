class RemoveColumnToPosts < ActiveRecord::Migration
  def self.up
    remove_column :posts, :lost_id
    remove_column :posts, :have_id
  end

  def self.down
    add_column :posts, :have_id, :integer
    add_column :posts, :lost_id, :integer
  end
end
