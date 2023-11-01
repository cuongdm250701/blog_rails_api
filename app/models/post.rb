class Post < ApplicationRecord
    belongs_to :user
    belongs_to :category_post
    has_many :comments
    has_many :post_favorites
    
    validates :title, presence: true
    validates :title, length: { maximum: 100 }
    validates :content, presence: true

    enum status: { pending: 1, refused: 2, approved: 3 }
    
    scope :posts_by_user, -> user_id { where user_id: user_id }
    scope :filter_by_title, -> title { where("title LIKE ?", "%#{title}%") if title.present? }
    scope :filter_by_status, -> state { where status: state if state.present? }
    scope :filter_by_category_post_id, -> category_post_id { where category_post_id: category_post_id if category_post_id.present? }

    scope :filter_post_by_id, -> post_id { where id: post_id }
    scope :filter_post_approved, -> state { where status: state }

    # scope :statistical_posts, -> { 
    #     left_outer_joins(:category_posts)
    #     .count("posts.id") 
    # }
end
