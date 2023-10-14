class PostFavorite < ApplicationRecord
    belongs_to :user
    belongs_to :post

    scope :list_post_favorites, -> user_id { 
        left_outer_joins(:post)
        .select("post_favorites.*", :title, :content)
        .where(user_id: user_id)
    }
end
