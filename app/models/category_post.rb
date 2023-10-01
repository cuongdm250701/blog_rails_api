class CategoryPost < ApplicationRecord
    validates :title, presence: true
    validates :title, length: { maximum: 100 }
    validates :title, uniqueness: true
end
