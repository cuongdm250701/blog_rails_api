class User < ApplicationRecord
  # attr_accessor :login


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
