class Tag < ActiveRecord::Base
  def self.lacks
    return Tag.find_by_sql('SELECT * FROM tags t where id in(select distinct tag_id from taggings where context="lacks")')
  end
  def self.holds
    return Tag.find_by_sql('SELECT * FROM tags t where id in(select distinct tag_id from taggings where context="holds")')
  end
  def self.areas
    return Tag.find_by_sql('SELECT * FROM tags t where id in(select distinct tag_id from taggings where context="areas")')
  end
end