module CategoriesHelper
  def gen_lacks_html(categories)
    r=""
    categories.each do |category|
      r+="&nbsp;&nbsp;<a href='###' class='gen_lacks_html'>#{category.name}</a>"
    end
    return r
  end
  def gen_holds_html(categories)
    r=""
    categories.each do |category|
      r+="&nbsp;&nbsp;<a href='###' class='gen_holds_html'>#{category.name}</a>"
    end
    return r
  end
end
