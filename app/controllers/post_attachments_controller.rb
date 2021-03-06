class PostAttachmentsController < ApplicationController
	before_action :set_post_attachment, only: [:show, :edit, :update, :destroy]


	def index
		@post_attachments = PostAttachment.all
	end

	def show

            @tags = @post_attachment.tags  
	end

	def new
		@post_attachment = PostAttachment.new
		
	end
 
	def edit
	
         
	end

	def create
		@post_attachment = PostAttachment.new

		respond_to do |format|
			if @post_attachment.save
				format.html { redirect_to @post_attachment, notice: 'Post attachment was successfully created.' }
				format.json { render :show, status: :created, location: @post_attachment }
			else
				format.html { render :new }
				format.json { render json: @post_attachment.errors, status: :unprocessable_entity }
			end
		end
@post_attachment.tag(post_attachment_params)
	end

 
	def update
		respond_to do |format|
			if @post_attachment.update(post_attachment_params)
			format.html { redirect_to @post_attachment, notice: 'attachment updated.' }
          		end
		end
  
	end	
  
	def destroy
		@post_attachment = PostAttachment.find(params[:id])
  		if @post_attachment.destroy
			redirect_to posts_path
    		end
	end


	private
  
	def set_post_attachment
    
		@post_attachment = PostAttachment.find(params[:id])
	end

	def post_attachment_params
		params.require(:post_attachment).permit(:id, :post_id, :avatar, :tags_attributes =>  [:tag_name, :post_attachment_id, :id])
	end

end           
