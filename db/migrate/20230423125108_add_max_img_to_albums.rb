class AddMaxImgToAlbums < ActiveRecord::Migration[7.0]
  def change
    add_column :albums, :max_images, :integer, default: 25, null: false
  end
end
