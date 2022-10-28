class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'
#validation
  validates :Name, presence: true
  validates :PostCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def return_recent_posts
    Post.limit(3).order(created_at: :desc)
  end
end
