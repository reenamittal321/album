class RemoveColumns < ActiveRecord::Migration
  def change
  end

def self.up
  remove_column :tags, :name
  remove_column :tags, :post_id
  remove_column :tags, :post_ig
end
end
