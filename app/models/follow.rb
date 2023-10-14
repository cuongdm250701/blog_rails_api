class Follow < ApplicationRecord
    belongs_to :followed_user, :class_name => 'User'
    belongs_to :follower_by_user, :class_name => 'User'

    scope :list_user_followed, -> current_user_id { 
        left_outer_joins(:followed_user)
        .where(follower_by_user_id: current_user_id) 
        .select("follows.*", :username, :email)
    }

    scope :search_by_username, -> username {
        where("username LIKE ?", "%#{username}%") if username.present?
    }

    scope :search_by_email, -> email {
        where("email LIKE ?", "%#{email}%") if email.present?
    }
end
