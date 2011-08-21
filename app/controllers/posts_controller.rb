#coding:utf-8
class PostsController < ApplicationController
  before_filter :login_required, :except => [:index,:show]


  def index
    #@posts = Post.all
    @posts= Post.where(:pass=>false).order(:created_at).page params[:page]
    @json=Post.where("latitude is not null and longitude is not null").all.to_gmaps4rails
    #@json=[Post.last].to_gmaps4rails
    render :layout=>"map"
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
    @post.ip=request.remote_ip
    #====仅在开发时使用
    if @post.ip=="127.0.0.1" or @post.ip=="localhost"
      @post.address="115.210.222.177"
    end
    #=======
    #address字段用于存放ip或是人式输入的地址，根据此字段查出以对应的经纬坐标，查询坐标的工作要在后台异步进行

    #@post.address=request.location.address
    #@post.address="115.210.222.177"
    logger.error("==================================")
    logger.error(@post.ip)
    logger.error(@post.address)
                        
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
