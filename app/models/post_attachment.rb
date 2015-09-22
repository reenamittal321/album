class PostAttachment < ActiveRecord::Base
 
        mount_uploader :avatar, AvatarUploader
           
        belongs_to :post
        has_many :tags
        accepts_nested_attributes_for :tags, allow_destroy: true


	
end
