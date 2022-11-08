require 'rails_helper'

RSpec.describe 'user profile page', type: :system do
  before do
    @user1 = User.create(name: 'Test User1',
                         photo: 'https://images.unsplash.com/photo-1492681290082-e932832941e6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2942&q=80', bio: 'Test bio 1.', posts_counter: 0)
    @user2 = User.create(name: 'Test User2',
                         photo: 'https://images.unsplash.com/photo-1494959764136-6be9eb3c261e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80', bio: 'Test bio 2.', posts_counter: 0)

    @post1 = Post.create(author: @user1, title: 'Auctor neque vitae',
                         text: 'Pharetra pharetra massa massa ultricies mi quis hendrerit dolor magna eget est lorem ipsum dolor sit amet adipiscing elit pellentesque habitant morbi tristique senectus', comments_counter: 0, likes_counter: 0)
    @post2 = Post.create(author: @user2, title: 'Consectetur lorem',
                         text: 'Congue eu consequat ac felis donec et odio pellentesque diam volutpat commodo sed egestas egestas fringilla phasellus', comments_counter: 0, likes_counter: 0)
    @post3 = Post.create(author: @user1, title: 'nulla facilisi',
                         text: 'metus vulputate eu scelerisque felis imperdiet proin fermentum leo vel orci porta non pulvinar neque laoreet suspendisse interdum consectetur libero', comments_counter: 0, likes_counter: 0)
    @post4 = Post.create(author: @user2, title: 'vulputate odio',
                         text: 'tristique risus nec feugiat in fermentum posuere urna nec tincidunt praesent semper feugiat nibh sed pulvinar proin gravida hendrerit',
                         comments_counter: 0, likes_counter: 0)
    @post5 = Post.create(author: @user1, title: 'a diam',
                         text: 'dui vivamus arcu felis bibendum ut tristique et egestas quis ipsum suspendisse ultris ultricies lacus sed',
                         comments_counter: 0, likes_counter: 0)
    @post6 = Post.create(author: @user2, title: 'morbi non',
                         text: 'ac felis donec et odio pellentesque diam volutpat commodo sed egestas egestas fringilla phasellus vulputate sapien nec sagittis aliquam malesuada',
                         comments_counter: 0, likes_counter: 0)

    Comment.create(post: @post1, author: @user2, text: 'neque sodales ut etiam sit amet!')
    Comment.create(post: @post2, author: @user1,
                   text: 'pellentesque elit eget gravida cum sociis natoque penatibus et magnis!')
  end

  it "show the user's picture picture" do
    visit "/users/#{@user1.id}"
    expect(page).to have_selector("img[src*='#{@user1.photo}']")
    # sleep(2)
  end

  it "show the user's picture picture" do
    visit "/users/#{@user1.id}"
    expect(page).to have_content(@user1.name)
    # sleep(2)
  end

  it 'shows number of posts the user has written' do
    visit "/users/#{@user1.id}"
    expect(page).to have_content("Number of Posts : #{@user1.posts_counter}")
    # sleep(2)
  end

  it 'shows theuser\'s bio ' do
    visit "/users/#{@user1.id}"
    expect(page).to have_content(@user1.bio)
    # sleep(2)
  end

  it 'shows three recent posts' do
    visit "/users/#{@user1.id}"
    expect(page).to have_content(@post1.text)
    expect(page).to have_content(@post3.text)
    expect(page).to have_content(@post5.text)
    expect(page).not_to have_content(@post4.text)
    # sleep(2)
  end

  it 'should redirect to the users profile page' do
    visit "/users/#{@user1.id}"
    click_on('Load')
    expect(page).to have_current_path("/users/#{@user1.id}/posts")
    # sleep(2)
  end

  it 'should redirect to the user\'s post\'s page' do
    visit "/users/#{@user1.id}"
    click_on @post1.title
    expect(page).to have_current_path("/users/#{@user1.id}/posts/#{@post1.id}")
  end
end
