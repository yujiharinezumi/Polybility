class Post < ApplicationRecord
  mount_uploader :image, PictureUploader

  has_many :favorites, dependent: :destroy
  has_many :favorites_users, through: :favorites, source: :user
  has_many  :comments, dependent: :destroy

  belongs_to :user

  validates :title, presence: true, length: { maximum: 30 }
  validates :content, presence: true, length: {maximum: 75}
end
