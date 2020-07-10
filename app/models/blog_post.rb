class BlogPost < ApplicationRecord
  belongs_to :blog

  validates :name, presence: true
end
