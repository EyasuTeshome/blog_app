require 'rails_helper'
require 'ffi'

RSpec.describe Like, type: :model do
  user = User.create(name: 'Josh', photo: 'https://microverse.org', bio: 'Hello, I am Micronaut',
                     posts_counter: 3)
  post = Post.create(title: 'Hello', text: 'Hello world', author_id: user.id, likes_counter: 6, comments_counter: 3)

  like = Like.create(author_id: user.id, post_id: post.id)

  context 'Update likes counter' do
    like.update_like_counter

    it 'should increment likes counter' do
      expect(post.likes_counter).to eq(6)
    end
  end
end
