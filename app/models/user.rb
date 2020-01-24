class User < ApplicationRecord
  mount_uploader :icon, ImageUploader
  has_many :posts, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :active_relationships, foreign_key: 'follower_id', class_name: 'Relationship', dependent: :destroy
  has_many :passive_relationships, foreign_key: 'followed_id', class_name: 'Relationship', dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  has_many :labelings, dependent: :destroy
  has_many :labels, through: :labelings
  has_many :messages, dependent: :destroy
  has_many :sender_conversations, foreign_key: 'sender_id', class_name: 'Conversation', dependent: :destroy
  has_many :recipient_conversations, foreign_key: 'recipient_id', class_name: 'Conversation', dependent: :destroy
  validates :name, presence: true,length: {maximum: 35}
  validates :age, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook,:google_oauth2,:twitter]
          # omniauth_providers: %i[facebook twitter google]


    def follow!(other_user)
      active_relationships.create!(followed_id: other_user.id)
    end

    def following?(other_user)
      active_relationships.find_by(followed_id: other_user.id)
    end

    def unfollow!(other_user)
      active_relationships.find_by(followed_id: other_user.id).destroy
    end

# ゲストユーザーのログインのメソッド
    def self.guest
      find_or_create_by!(name: 'guest',email: 'guest@example.com') do |user|
        user.password = SecureRandom.urlsafe_base64
        # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
      end
    end

    def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
        user.name = auth.info.name   # assuming the user model has a name
        user.icon = auth.info.icon # assuming the user model has an image
        # If you are using confirmable and the provider(s) you use validate emails,
        # uncomment the line below to skip the confirmation emails.
        # user.skip_confirmation!
      end
    end

    private

    def self.dummy_email(auth)
      "#{auth.uid}-#{auth.provider}@example.com"
    end

    # def last_admin_not_delete
    #   throw(:abort) if User.where(admin: true).length == 1 && self.admin?
    # end
end
