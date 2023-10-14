class CategoryPost < ApplicationRecord
    has_many :posts
    accepts_nested_attributes_for :posts, limit: 3, reject_if: :reject_posts
    
    validates :title, presence: true
    validates :title, length: { maximum: 100 }
    validates :title, uniqueness: true

    scope :filter_by_title, -> title { where("title LIKE ?", "%#{title}%") if title.present? }

    private

    def reject_posts(attribute)
        attribute['title'].blank? || attribute['content'].blank?
    end
end
