class User < ApplicationRecord
    has_secure_password
    has_many :albums, dependent: :destroy
    has_many :images, dependent: :destroy
    validates :email, presence: true, uniqueness: true
end
