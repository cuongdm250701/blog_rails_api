class CategoryPost < ApplicationRecord
    has_many :posts

    validates :title, presence: true
    validates :title, length: { maximum: 100 }
    validates :title, uniqueness: true

    scope :filter_by_title, -> title { where("title LIKE ?", "%#{title}%") if title.present? }
end
