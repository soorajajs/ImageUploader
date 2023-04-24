class CreateImage < ActiveRecord::Migration[7.0]
  def change
    create_table :images do |t|
      t.attachment :file
      t.references :album, null: false, foreign_key: true
      t.string :caption
      t.timestamps
    end
  end
end
