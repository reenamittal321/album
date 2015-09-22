class RemovePostAttachmentIdFromTags < ActiveRecord::Migration
  def change
    remove_column :tags, :post__attachment_id, :integer
  end
end
