class RenameLostToCategories < ActiveRecord::Migration
  def self.up
    rename_column :categories, :lost, :lack
    
  end

  def self.down
    rename_column :categories, :lack, :lost
  end
end
