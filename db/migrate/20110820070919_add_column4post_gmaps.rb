class AddColumn4postGmaps < ActiveRecord::Migration
  def self.up
    add_column :posts, :latitude, :float #you can change the name, see wiki
    add_column :posts, :longitude, :float #you can change the name, see wiki
    add_column :posts, :gmaps, :boolean #not mandatory, see wiki
    add_column :posts, :address, :string
    
  end

  def self.down
    remove_column :posts, :latitude, :float #you can change the name, see wiki
    remove_column :posts, :longitude, :float #you can change the name, see wiki
    remove_column :posts, :gmaps, :boolean #not mandatory, see wiki
    remove_column :posts, :address, :string
  end
end
