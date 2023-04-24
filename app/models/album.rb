class Album < ApplicationRecord
    belongs_to :user
    has_many :images, dependent: :destroy
    validates :name, presence:true
 
    validates :max_images, numericality: { greater_than_or_equal_to: 1 }


    def max_photos
        errors.add(:base,"cannot exceed 25")if images.size > 25
    end
end
