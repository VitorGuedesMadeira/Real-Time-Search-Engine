class Article < ApplicationRecord
    validates :title, presence: true, length: { maximum: 50 }
    validates :description, presence: true, length: { minimum: 50, maximum: 2500 }
    validates :author, presence: true, length: { maximum: 50 }
end
