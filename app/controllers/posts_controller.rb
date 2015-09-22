class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

 
  def index
    @posts = Post.all.paginate(page: params[:page], per_page: 5)
    
  end

 
  def show
    @post_attachment = @post.post_attachments.all
  end

  
  def new
 
    @post = Post.new
    @post_attachment = @post.post_attachments.build
    @post_attachment.tags.build
  end


  def edit
     
    @post_attachments = @post.post_attachments.all  
 
  end

  def create   
    @post = Post.new(post_params)
    @post.save
    redirect_to posts_path
  end

  def update     

     if @post.update_attributes(post_params)
        @post.save
        redirect_to posts_path
     end

  end

  def destroy
     
     if @post.destroy      
        redirect_to posts_path
     end    
  end

  def removed
     @posts = Post.all
   @p = @posts.only_deleted
  end

  def restore   
  
     @a = Post.restore(params[:id])
     if @a
        redirect_to posts_path
     end
  end
 
  def destroyed
      @d = Post.with_deleted.find(params[:id]).really_destroy!
      if @d
        redirect_to posts_path
      end
  end

  private
   
    def set_post            
       @post = Post.find(params[:id])
    end

  
    def post_params
      params.require(:post).permit(:id, :title, :post_attachments_attributes => [:id, :post_id, :avatar, :tags_attributes => [:id, :post_attachment_id, :tag_name]])
    end
end
