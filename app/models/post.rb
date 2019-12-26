class Post < ApplicationRecord
  mount_uploader :image, ImageUploader

  has_many :favorites, dependent: :destroy
  has_many :favorites_users, through: :favorites, source: :user

  has_many  :comments, dependent: :destroy

  belongs_to :user

  validates :title, presence: true
  validates :content, presence: true



  # def favorited_by?(user) #いいねしているかどうか
  #   favorites.where(user_id: user.id).exists?
  # end
end
