class RenameLostToCategories < ActiveRecord::Migration
  def self.up
    create_table "categories", :force => true do |t|
      t.string   "name"
      t.boolean  "hidden"
      t.boolean  "lack"
      t.datetime "created_at"
      t.datetime "updated_at"
    end    
  end

  def self.down
    drop_table "categories"
  end
end
