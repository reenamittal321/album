class Post < ActiveRecord::Base

	acts_as_paranoid
        has_many :post_attachments
	has_many :tags, through: :post_attachments
	accepts_nested_attributes_for :post_attachments, allow_destroy: true
	
	
end

	
