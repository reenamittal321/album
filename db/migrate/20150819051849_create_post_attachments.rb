class CreatePostAttachments < ActiveRecord::Migration
  def change
    create_table :post_attachments do |t|
      t.integer :post_id
      t.string :avatar
      t.string :tag_names
      t.timestamps null: false
    end
  end
end
