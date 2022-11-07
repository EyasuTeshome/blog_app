require 'rails_helper'
require 'ffi'

RSpec.describe Comment, type: :model do
  user = User.create(name: 'Josh', photo: 'https://www.kindpng.com/picc/m/21-214439_free-high-quality-person-icon-default-profile-picture.png', bio: 'Hello, I am Micronaut',
                     posts_counter: 3)
  post = Post.create(title: 'Hello', text: 'Hello world', author_id: user.id, likes_counter: 6, comments_counter: 3)

  comment = Comment.create(text: 'Hello world', post_id: post.id)

  context 'Update comments counter' do
    comment.update_comment_counter

    it 'should increment comments counter' do
      expect(post.comments_counter).to eq(3)
    end
  end
end
