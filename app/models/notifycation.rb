class Notifycation < ApplicationRecord
    belongs_to :created_by, :class_name => "User"
    belongs_to :receiver, :class_name => "User"

    scope :list_notifycation, -> current_user_id {
        left_outer_joins(:created_by)
        .select("notifycations.*", :username)
        .where(receiver_id: current_user_id)
    }

    scope :search_by_title, -> title {
        where("title LIKE ?", "%#{title}%") if title.present?
    }

    scope :search_by_content, -> content {
        where("content LIKE ?", "%#{content}%") if content.present?
    }
end
