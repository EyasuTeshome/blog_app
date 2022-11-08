require 'rails_helper'

RSpec.describe 'visit home page', type: :system do
  before do
    @user1 = User.create(name: 'Test User1', photo: 'https://images.unsplash.com/photo-1492681290082-e932832941e6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2942&q=80', bio: 'Test bio 1.', posts_counter: 0)
    @user2 = User.create(name: 'Test User2', photo: 'https://images.unsplash.com/photo-1494959764136-6be9eb3c261e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80', bio: 'Test bio 2.', posts_counter: 0)

    @post1 = Post.create(author: @user1, title: 'Auctor neque vitae', text: 'Pharetra pharetra massa massa ultricies mi quis hendrerit dolor magna eget est lorem ipsum dolor sit amet consectetur adipiscing elit pellentesque habitant morbi tristique senectus', comments_counter: 0, likes_counter: 0, )
    @post2 = Post.create(author: @user2, title: 'Consectetur lorem', text: 'Congue eu consequat ac felis donec et odio pellentesque diam volutpat commodo sed egestas egestas fringilla phasellus', comments_counter: 0, likes_counter: 0, )
    @post3 = Post.create(author: @user1, title: 'nulla facilisi', text: 'metus vulputate eu scelerisque felis imperdiet proin fermentum leo vel orci porta non pulvinar neque laoreet suspendisse interdum consectetur libero', comments_counter: 0, likes_counter: 0, )
    @post4 = Post.create(author: @user2, title: 'vulputate odio', text: 'tristique risus nec feugiat in fermentum posuere urna nec tincidunt praesent semper feugiat nibh sed pulvinar proin gravida hendrerit', comments_counter: 0, likes_counter: 0, )
    @post5 = Post.create(author: @user1, title: 'a diam', text: 'dui vivamus arcu felis bibendum ut tristique et egestas quis ipsum suspendisse ultrices gravida dictum fusce ut placerat orci nulla pellentesque dignissim enim sit amet venenatis urna cursus eget nunc scelerisque viverra mauris in aliquam sem fringilla ut morbi tincidunt augue interdum velit euismod in pellentesque massa placerat duis ultricies lacus sed', comments_counter: 0, likes_counter: 0, )
    @post6 = Post.create(author: @user2, title: 'morbi non', text: 'ac felis donec et odio pellentesque diam volutpat commodo sed egestas egestas fringilla phasellus faucibus scelerisque eleifend donec pretium vulputate sapien nec sagittis aliquam malesuada', comments_counter: 0, likes_counter: 0, )

    Comment.create(post: @post1, author: @user2, text: 'neque sodales ut etiam sit amet!')
    Comment.create(post: @post2, author: @user1, text: 'pellentesque elit eget gravida cum sociis natoque penatibus et magnis!')
  end


  describe 'index page' do
    it 'shows the username of all other users' do
      visit '/'
      expect(page).to have_content(@user1.name)
      sleep(2)
    end

    it 'show the profile picture for each user' do
      visit '/'
      expect(page).to have_selector("img[src*='#{@user1.photo}']")
      sleep(2)
    end

    it 'shows number of posts each user has written' do
      visit '/'
      expect(page).to have_content("Number of Posts : #{@user1.posts_counter}")
      sleep(2)
    end

    it 'directs to the users profile page' do
      visit '/'
      click_on @user1.name
      expect(page).to have_current_path("/users/#{@user1.id}")
      sleep(2)
    end
        
  end
end