class Post < ActiveRecord::Base
  attr_accessible :quantity, :demand, :qq, :mobile, :contact
  acts_as_taggable_on :lacks, :holds, :areas
  belongs_to :user
  acts_as_gmappable
  geocoded_by :address do |obj,results|
    if geo = results.first
      obj.address    = geo.address
    end
  end# can also be an IP address
  after_validation :geocode 
  def gmaps4rails_address
    #describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki
    #"#{self.street}, #{self.city}, #{self.country}"
    address
  end
  def gmaps4rails_infowindow
    "<h4>#{lack_list}</h4>" << "<h4>#{hold_list}</h4>"
  end  
  #define_index do
  #  indexes :demand #model的一个字段 indexes就会检索这个字段
  #end
  #searchable :auto_index => true, :auto_remove =>true do
  #  text :demand,:stored=>true
  #  time :updated_at
  #end
end
#Sunspot.setup(Post) do
#  text :demand, :stored => true
#  #string :author_name
#  #integer :blog_id
#  #integer :category_ids
#  #float :average_rating, :using => :ratings_average
#  #time :published_at
#  #string :sort_title do
#  #  title.downcase.sub(/^(an?|the)\W+/, ''/) if title = self.title
#  #end
#end