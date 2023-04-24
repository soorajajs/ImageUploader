class Image < ApplicationRecord
  belongs_to :user
  belongs_to :album
  #has_attached_file :photo_name, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  #validates_attachment_content_type :photo_name, :content_type => ["image/jpeg", "image/png"]
  has_attached_file :file, :path => ":rails_root/public/:class/:id/:basename.:extension"
  validates_attachment_content_type :file, content_type: /\Aimage\/.*\z/
  validates :caption, length:{maximum:255}

end
