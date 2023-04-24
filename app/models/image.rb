class Image < ApplicationRecord
  belongs_to :user
  belongs_to :album
  validates :photo_name, presence:true
  validates :caption, length:{maximum:255}
  has_attached_file :photo_name, path:":rails_root/public/:id/:filename"
  validates_attachment_content_type :photo_name, content_type: /\Aimage\/.*\z/
end
