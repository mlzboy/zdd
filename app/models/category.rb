class Category < ActiveRecord::Base
  attr_accessible :name, :hidden, :lack
  named_scope :lacks,:conditions=>{:hidden=>false,:lack=>true}
  named_scope :holds,:conditions=>{:hidden=>false,:lack=>false}
end
