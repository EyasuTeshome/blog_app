# require 'rails_helper'

# RSpec.describe 'user profile page', type: :system do
#   before do
#     @user1 = User.create(name: 'Test User1', photo: 'https://images.unsplash.com/photo-1492681290082-e932832941e6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2942&q=80', bio: 'Test bio 1.', posts_counter: 0)
#     @user2 = User.create(name: 'Test User2', photo: 'https://images.unsplash.com/photo-1494959764136-6be9eb3c261e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80', bio: 'Test bio 2.', posts_counter: 0)

#     @post1 = Post.create(author: @user1, title: 'Auctor neque vitae', text: 'Pharetra pharetra massa massa ultricies mi quis hendrerit dolor magna eget est lorem ipsum dolor sit amet consectetur adipiscing elit pellentesque habitant morbi tristique senectus', comments_counter: 0, likes_counter: 0, )
#     @post2 = Post.create(author: @user2, title: 'Consectetur lorem', text: 'Congue eu consequat ac felis donec et odio pellentesque diam volutpat commodo sed egestas egestas fringilla phasellus', comments_counter: 0, likes_counter: 0, )
#     @post3 = Post.create(author: @user1, title: 'nulla facilisi', text: 'metus vulputate eu scelerisque felis imperdiet proin fermentum leo vel orci porta non pulvinar neque laoreet suspendisse interdum consectetur libero', comments_counter: 0, likes_counter: 0, )
#     @post4 = Post.create(author: @user2, title: 'vulputate odio', text: 'tristique risus nec feugiat in fermentum posuere urna nec tincidunt praesent semper feugiat nibh sed pulvinar proin gravida hendrerit', comments_counter: 0, likes_counter: 0, )
#     @post5 = Post.create(author: @user1, title: 'a diam', text: 'dui vivamus arcu felis bibendum ut tristique et egestas quis ipsum suspendisse ultrices gravida dictum fusce ut placerat orci nulla pellentesque dignissim enim sit amet venenatis urna cursus eget nunc scelerisque viverra mauris in aliquam sem fringilla ut morbi tincidunt augue interdum velit euismod in pellentesque massa placerat duis ultricies lacus sed', comments_counter: 0, likes_counter: 0, )
#     @post6 = Post.create(author: @user2, title: 'morbi non', text: 'ac felis donec et odio pellentesque diam volutpat commodo sed egestas egestas fringilla phasellus faucibus scelerisque eleifend donec pretium vulputate sapien nec sagittis aliquam malesuada', comments_counter: 0, likes_counter: 0, )

#     Comment.create(post: @post1, author: @user2, text: 'neque sodales ut etiam sit amet!')
#     Comment.create(post: @post2, author: @user1, text: 'pellentesque elit eget gravida cum sociis natoque penatibus et magnis!')
#   end

#   # I can see the user's profile picture.
#   it "show the user's picture picture" do
#     visit "/users/#{@user1.id}"
#     expect(page).to have_selector("img[src*='#{@user1.photo}']")
#     # sleep(3)
#   end

#   # I can see the user's username.
#   it "show the user's picture picture" do
#     visit "/users/#{@user1.id}"
#     expect(page).to have_content(@user1.name)
#     # sleep(3)
#   end

#   # I can see the number of posts the user has written.
#   it 'shows number of posts the user has written' do
#     visit "/users/#{@user1.id}"
#     expect(page).to have_content("Number of Posts : #{@user1.posts_counter}")
#     # sleep(3)
#   end

#   # I can see the user's bio.
#   it 'shows theuser\'s bio ' do
#     visit "/users/#{@user1.id}"
#     expect(page).to have_content(@user1.bio)
#     # sleep(3)

#   end

#   # I can see the user's first 3 posts.
#   it 'shows three recent posts' do
#     visit "/users/#{@user1.id}"
#     expect(page).to have_content(@post1.text)
#     expect(page).to have_content(@post2.text)
#     expect(page).to have_content(@post3.text)
#     expect(page).not_to have_content(@post4.text)
#     sleep(3)
#   end

#   # I can see a button that lets me view all of a user's posts.

#   # When I click a user's post, it redirects me to that post's show page.

#   # When I click to see all posts, it redirects me to the user's post's index page.

# end