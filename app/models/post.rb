class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  after_save :update_post_counter
  # validation
  validates :title, presence: true, length: { maximum: 200 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def return_recent_comments
    Comment.limit(10).order(created_at: :desc)
  end

  def update_post_counter
    author.increment!(:posts_counter)
  end
end
