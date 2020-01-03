class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  validates :content, presence: true

  # def comment_time
  #   created_at.strftime("%m/%d/%y at %l:%M %p")
  # end
end
