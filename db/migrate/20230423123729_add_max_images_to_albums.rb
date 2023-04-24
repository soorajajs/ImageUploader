class AddMaxImagesToAlbums < ActiveRecord::Migration[7.0]

  def down
    remove_column :albums, :max_images, :integer, default: 10, null: false
  end
end
