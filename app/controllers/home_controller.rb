#coding:utf-8
class HomeController < ApplicationController
  #before_filter :login_required, :except => [:index]
  def index
  end
  def search
    #@posts=Post.all
    render :layout=>"search"
  end
  def search2
    r=[]
    if request.post?
      logger.error("dddddddddddddddddddddddd")
      lacks=params["lacks"] || []
      holds=params["holds"] || []
      areas=params["areas"] || []
      logger.error("YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY")
    logger.error(lacks)
    logger.error(holds)
    logger.error(areas)
      r+=lacks
      r+=holds
      r+=areas
    else
      logger.error(">>>>>>>>>>>>>>>>>")
      lacks=params["lacks"] || []
      if lacks.size > 0
        lacks=lacks.gsub(/[ ,;，；]+/," ").split(" ")
        r+=lacks
      end
      holds=params["holds"] || []
      if holds.size > 0
        holds=holds.gsub(/[ ,;，；]+/," ").split(" ")
        r+=holds
      end      
      areas=params["areas"] || []
      if areas.size > 0
        areas=areas.gsub(/[ ,;，；]+/," ").split(" ")
        r+=areas
      end        
    end
    logger.error(r)
    r=r.map!{|e| e.strip}.uniq.reject{|e| e==""}
    logger.error("$$$fffffffffffffff$$$$$$$$$")
    #lacks.map!{|e| e.to_s.strip}.uniq.reject!{|e| e==""}
    #holds.map!{|e| e.to_s.strip}.uniq.reject!{|e| e==""}
    #areas.map!{|e| e.to_s.strip}.uniq.reject!{|e| e==""}
    #r << lacks
    #r << holds
    #r << areas
    #r.map!{|e| e.to_s.strip}.uniq.reject!{|e| e==""}
    if r.size>0
      @posts=Post.tagged_with(r,:any=>true) 
      #@posts=Post.tagged_with(r,:match_all=>true) 
    else
      @posts=Post.all
    end
    #@posts=Post.tagged_with(lacks, :on => :lacks, :any => true).tagged_with(holds, :on => :holds, :any => true).tagged_with(areas,:on=>:areas,:any=>true)

    logger.error(@posts)
    render :layout=>"search"
  end
end
