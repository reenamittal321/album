class CreateTags < ActiveRecord::Migration
  def up
    create_table :tags do |t|

      t.timestamps null: false
    end

     
  end
   
  def down
    remove_column :tags, :name   
  end
end
  

    
 

