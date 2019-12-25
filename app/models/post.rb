class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_many :favorites, dependent: :destroy
  has_many :favorites_users, through: :favorites, source: :user
  belongs_to :user

  validates :title, presence: true
  validates :content, presence: true
end
