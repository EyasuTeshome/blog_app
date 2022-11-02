class Like < ApplicationRecord
  belongs_to :post, class_name: 'Post', foreign_key: 'post_id'
  belongs_to :author, class_name: 'User'

  after_save :update_like_counter

  def update_like_counter
    post.increment!(:likes_counter)
  end
end
