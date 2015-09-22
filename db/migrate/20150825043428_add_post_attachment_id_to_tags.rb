class AddPostAttachmentIdToTags < ActiveRecord::Migration
  def change
    add_column :tags, :post_attachment_id, :integer
  end
end
