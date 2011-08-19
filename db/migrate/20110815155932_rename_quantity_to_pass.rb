class RenameQuantityToPass < ActiveRecord::Migration
  def self.up
    remove_column :posts, :quantity
    add_column :posts,:pass,:boolean,:default=>false
  end

  def self.down
    add_column :posts,:quantity,:integer
    remove_column :posts, :pass
  end
end
