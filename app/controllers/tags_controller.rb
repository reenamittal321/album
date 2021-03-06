class TagsController < ApplicationController
  before_action :set_tag, only: [:show, :edit, :update, :destroy]

  def index
    @tags = Tag.all
  end

  def show

    @tags = Tag.all.where(tag_name:@tag.tag_name)
	
  end

  def new

  end
  
  def edit

  end

  private
  def set_tag
   @tag = Tag.find(params[:id])
  end

  def tag_params
    params.require(:tag).permit(:id, :post_attachment_id, :tag_name)
  end
end
