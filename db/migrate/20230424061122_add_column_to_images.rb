class AddColumnToImages < ActiveRecord::Migration[7.0]
  def change
    add_column :images, :photo_name_file_name, :string
    add_column :images, :photo_name_content_type, :string
   
    add_column :images, :photo_name_file_size, :integer
  end
end
