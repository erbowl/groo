class User < ApplicationRecord
  has_many :room_users
  has_many :rooms,through: :room_users
  before_create :set_uuid
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]
  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first
    unless user
      user = User.create(
        uid: auth.uid,
        provider: auth.provider,
        email: User.dummy_email(auth),
        password: Devise.friendly_token[0, 20]
      )
    end
    return user
  end

  private
  # TODO: facebookからメルアドを取得する そして、取得できなかった場合は促す仕組み
  # Create dummy email for OAuth
  def self.dummy_email(auth)
   "#{auth.uid}-#{auth.provider}@example.com"
  end

end
