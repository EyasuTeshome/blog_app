require 'rails_helper'

RSpec.describe 'Render posts index page', type: :feature do
  before :each do
    @user = User.create(name: 'Bengi', photo: 'https://www.linkedtour.com/images/lkavatar.png',
                        bio: 'I am Micronaut, studying full stack development', posts_counter: 0)
    @first_post = Post.create(title: 'Microverse',
                              text: 'Microverse online teaching school for those who want to be developers',
                              comments_counter: 0, likes_counter: 0, author: @user)
    @second_post = Post.create(title: 'Microverse', text: 'The same post like the first one', comments_counter: 0,
                               likes_counter: 0,
                               author: @user)
    5.times do |_i|
      Comment.create(text: 'Nice post!!', author_id: @user.id, post_id: @first_post.id)
    end
    visit user_post_path(@first_post.author, @first_post)
  end

  scenario 'displays post text' do
    expect(page).to have_content('Microverse online teaching school for those who want to be developers')
  end

  scenario 'display the post title' do
    expect(page).to have_content(@first_post.title)
  end

  scenario 'display the post body' do
    expect(page).to have_content(@first_post.text)
  end

  scenario 'display the first comment on a post' do
    expect(page).to have_content('Microverse')
  end

  scenario 'display the how many comments' do
    expect(page).to have_content('Comments: 5')
  end

  scenario 'display the how many Likes' do
    expect(page).to have_content('Likes: 0')
  end

  scenario "redirects the user to the post's show page after clicking on it" do
    visit '/'
    click_link(@user.name)
    expect(page).to have_content(@user.name)
  end
end
