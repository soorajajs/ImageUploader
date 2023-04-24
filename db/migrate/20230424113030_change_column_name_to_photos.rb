class ChangeColumnNameToPhotos < ActiveRecord::Migration[7.0]
  def change
    rename_column :images, :image, :photo_name
  end
end
