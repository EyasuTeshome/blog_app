class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  after_save :update_post_counter
#validation
  validates :Title, presence: true, length: { maximum: 200 }
  validates :CommentsCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :LikesCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def return_recent_comments
    Comment.limit(5).order(created_at: :desc)
  end

  private

  def update_post_counter
    author.increment!(:PostCounter)
  end
end
