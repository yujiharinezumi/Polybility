class User < ApplicationRecord

  # paginates_per 8

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

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook,:google]
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


    def self.guest
      find_or_create_by!(email: 'guest@example.com') do |user|
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


    def self.find_for_google(auth)
      user = User.find_by(email: auth.info.email)

      unless user
      user = User.create(name:     auth.info.name,
                        email: auth.info.email,
                        provider: auth.provider,
                        uid:      auth.uid,
                        token:    auth.credentials.token,
                        password: Devise.friendly_token[0, 20],
                        meta:     auth.to_yaml)
      end
          user
    end


    # ダイバーでのやり方
    #     def self.create_unique_string
    #       SecureRandom.uuid
    #     end
    #
    #
    # def self.find_for_google(auth)
    #   user = User.find_by(email: auth.info.email)
    #
    #   unless user
    #     user = User.new(email: auth.info.email,
    #                     provider: auth.provider,
    #                     uid:      auth.uid,
    #                     password: Devise.friendly_token[0, 20],
    #                              )
    #   end
    #   user.save
    #   user
    # end



    # def self.from_omniauth(auth)
    #   where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    #     user.email = auth.info.email
    #     user.password = Devise.friendly_token[0,20]
    #   end
    # end

  #   def self.from_omniauth(auth)
  #   where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
  #     user.provider = auth.provider
  #     user.uid = auth.uid
  #     user.name = auth.name
  #     user.email = auth.info.email
  #     user.password = Devise.friendly_token[0, 20] # ランダムなパスワードを作成
  #     user.image = auth.info.image.gsub("_normal","") if user.provider == "twitter"
  #     user.image = auth.info.image.gsub("picture","picture?type=large") if user.provider == "facebook"
  #   end
  # end

  # def self.find_for_oauth(auth)
  #     user = User.where(uid: auth.uid, provider: auth.provider).first
  #
  #     unless user
  #       user = User.create(
  #         uid:      auth.uid,
  #         provider: auth.provider,
  #         email:    auth.info.email,
  #         password: Devise.friendly_token[0, 20]
  #       )
  #     end
  #     user
  # end



end
