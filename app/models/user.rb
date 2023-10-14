class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :post_favorites
  has_many :be_followed, :class_name => "Follow", :foreign_key => "followed_user_id"
  has_many :follower_by, :class_name => "Follow", :foreign_key => "follower_by_user_id"


  enum role: { admin: 0, customer: 1 }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    def generate_jwt
      JWT.encode({ id: id, exp: 1.days.from_now.to_i }, ENV['DEVISE_JWT_SECRET_KEY'])
    end

    def self.find_for_database_authentication warden_condition
      conditions = warden_condition.dup
      login = conditions.delete(:login)
      where(conditions).where(
        ["lower(username) = :value OR lower(email) = :value",
        { value: login.strip.downcase}]).first
    end
end
