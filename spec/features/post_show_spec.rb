require 'rails_helper'

RSpec.describe 'Renders the post show page', type: :feature do
  before :each do
    @user = User.create(name: 'Bengi', photo: 'https://www.linkedtour.com/images/lkavatar.png',
                        bio: 'I am Micronaut, studying full stack development', posts_counter: 0)
    @first_post = Post.create(title: 'Microverse',
                              text: 'Microverse online teaching school for those who want to be developers',
                              comments_counter: 0, likes_counter: 0, author: @user)
    @second_post = Post.create(title: 'Microverse', text: 'The same post like the first one', comments_counter: 0,
                               likes_counter: 0,
                               author: @user)
    2.times do |_i|
      Comment.create(text: 'Nice post!!', author_id: @user.id, post_id: @first_post.id)
    end
    visit user_post_path(@first_post.author, @first_post)
  end

  scenario 'displays the post title' do
    expect(page).to have_content(@first_post.title)
  end

  scenario 'shows the person who wrote the post' do
    expect(page).to have_content('Bengi')
  end

  it 'can see the username of each commentor.' do
    expect(page).to have_content('Bengi')
  end

  scenario 'disolays number of comments' do
    expect(page).to have_content('Comments: 2')
  end

  scenario 'displays number of likes' do
    expect(page).to have_content('Likes: 0')
  end

  scenario 'displays the content of the post' do
    expect(page).to have_content(@first_post.text)
  end

  scenario 'can see the comments of each commentor.' do
    expect(page).to have_content 'Nice post!!'
    expect(page).to have_content 'Nice post!!'
  end
end
