class Tag < ActiveRecord::Base

	belongs_to :post_attachment
	belongs_to :post
end
