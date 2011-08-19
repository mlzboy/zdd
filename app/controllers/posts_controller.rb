#coding:utf-8
class PostsController < ApplicationController
  before_filter :login_required, :except => [:index,:show]


  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post])
    lacks=params[:post]["lack_list"].gsub(/[ ,;，；]+/," ").split(" ").uniq().join(",")
    @post.lack_list=lacks
    holds=params[:post]["hold_list"].gsub(/[ ,;，；]+/," ").split(" ").uniq().join(",")
    @post.hold_list=holds
    areas=params[:post]["area_list"].gsub(/[ ,;，；]+/,"").strip()
    @post.area_list=areas
    @post.user_id=session[:user_id]
    
                        
    if @post.save
      redirect_to @post, :notice => "Successfully created post."
    else
      render :action => 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    lacks=params[:post]["lack_list"].gsub(/[ ,;，；]+/," ").split(" ").uniq().join(",")
    @post.lack_list=lacks
    holds=params[:post]["hold_list"].gsub(/[ ,;，；]+/," ").split(" ").uniq().join(",")
    @post.hold_list=holds
    areas=params[:post]["area_list"].gsub(/[ ,;，；]+/,"").strip()
    @post.area_list=areas
    @post.save
    if @post.update_attributes(params[:post])
      redirect_to @post, :notice  => "Successfully updated post."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    Tagging.where(:taggable_type=>"Post").where(:taggable_id=>@post.id).all.each do |tagging|
      logger.error ("ddfffffffffffffffffffffffffffffffffffffff")
      if Tagging.where("tag_id=#{tagging.tag_id} and taggable_id<>#{tagging.taggable_id}").count == 0
        tag=Tag.find_by_id(tagging.tag_id)
        tag.destroy unless tag.nil?
        logger.error "================================"
      end  
      tagging.destroy
    end
    @post.destroy

    redirect_to posts_url, :notice => "Successfully destroyed post."
  end
end
