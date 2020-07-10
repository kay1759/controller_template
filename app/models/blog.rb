class Blog < ApplicationRecord
  has_many :blog_posts

  validates :name, presence: true
end
