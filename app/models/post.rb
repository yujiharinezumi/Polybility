class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_many  :comments, dependent: :destroy
  belongs_to :user

  validates :title, presence: true
  validates :content, presence: true
end
