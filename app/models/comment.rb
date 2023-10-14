class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :post

    validates :content, presence: true


    scope :comments_by_post_id, -> post_id { where post_id: post_id }
end
