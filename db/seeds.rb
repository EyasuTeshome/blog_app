# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Seeding..."

User.destroy_all

first_user = User.create(name: 'Baran', photo: 'https://images.unsplash.com/photo-1492681290082-e932832941e6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2942&q=80', bio: 'Sit amet porttitor eget dolor morbi non arcu.', posts_counter: 0)
second_user = User.create(name: 'Bengi', photo: 'https://images.unsplash.com/photo-1492681290082-e932832941e6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2942&q=80', bio: 'Vitae semper quis lectus nulla.', posts_counter: 0)
third_user = User.create(name: 'Hüseyin', photo: 'https://images.unsplash.com/photo-1492681290082-e932832941e6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2942&q=80', bio: 'Sapien et ligula ullamcorper malesuada proin.', posts_counter: 0)
fourth_user = User.create(name: 'Elif', photo: 'https://images.unsplash.com/photo-1492681290082-e932832941e6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2942&q=80', bio: 'Pulvinar elementum integer enim.', posts_counter: 0)
fifth_user = User.create(name: 'Kudra', photo: 'https://images.unsplash.com/photo-1492681290082-e932832941e6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2942&q=80', bio: 'Neque gravida in fermentum et sollicitudin ac.', posts_counter: 0)
sixth_user = User.create(name: 'Milo', photo: 'https://images.unsplash.com/photo-1492681290082-e932832941e6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2942&q=80', bio: 'dignissim diam quis enim lobortis scelerisque fermentum.', posts_counter: 0)

Post.destroy_all

first_post = Post.create(author: first_user, title: 'Auctor neque vitae', text: 'Pharetra pharetra massa massa ultricies mi quis hendrerit dolor magna eget est lorem ipsum dolor sit amet consectetur adipiscing elit pellentesque habitant morbi tristique senectus', comments_counter: 0, likes_counter: 0, )
second_post = Post.create(author: second_user, title: 'Consectetur lorem', text: 'Congue eu consequat ac felis donec et odio pellentesque diam volutpat commodo sed egestas egestas fringilla phasellus', comments_counter: 0, likes_counter: 0, )
third_post = Post.create(author: third_user, title: 'Vulputate enim', text: 'Non sodales neque sodales ut etiam sit amet nisl purus in mollis nunc sed id semper risus in hendrerit gravida rutrum quisque non tellus orci ac auctor augue mauris augue', comments_counter: 0, likes_counter: 0, )
fourth_post = Post.create(author: fourth_user, title: 'vulputate odio', text: 'tristique risus nec feugiat in fermentum posuere urna nec tincidunt praesent semper feugiat nibh sed pulvinar proin gravida hendrerit', comments_counter: 0, likes_counter: 0, )
fifth_post = Post.create(author: fifth_user, title: 'a diam', text: 'dui vivamus arcu felis bibendum ut tristique et egestas quis ipsum suspendisse ultrices gravida dictum fusce ut placerat orci nulla pellentesque dignissim enim sit amet venenatis urna cursus eget nunc scelerisque viverra mauris in aliquam sem fringilla ut morbi tincidunt augue interdum velit euismod in pellentesque massa placerat duis ultricies lacus sed', comments_counter: 0, likes_counter: 0, )
sixth_post = Post.create(author: sixth_user, title: 'maecenas volutpat', text: 'tortor vitae purus faucibus ornare suspendisse sed nisi lacus sed viverra tellus in hac habitasse platea dictumst vestibulum rhoncus', comments_counter: 0, likes_counter: 0, )
seventh_post = Post.create(author: first_user, title: 'nulla facilisi', text: 'metus vulputate eu scelerisque felis imperdiet proin fermentum leo vel orci porta non pulvinar neque laoreet suspendisse interdum consectetur libero', comments_counter: 0, likes_counter: 0, )
eighth_post = Post.create(author: second_user, title: 'sapien faucibus', text: 'malesuada proin libero nunc consequat interdum varius sit amet mattis vulputate enim nulla aliquet porttitor lacus luctus accumsan tortor posuere ac ut', comments_counter: 0, likes_counter: 0, )
nineth_post = Post.create(author: third_user, title: 'volutpat maecenas', text: 'adipiscing bibendum est ultricies integer quis auctor elit sed vulputate mi sit amet mauris commodo quis imperdiet massa tincidunt nunc pulvinar sapien', comments_counter: 0, likes_counter: 0, )
tenth_post = Post.create(author: fourth_user, title: 'morbi non', text: 'ac felis donec et odio pellentesque diam volutpat commodo sed egestas egestas fringilla phasellus faucibus scelerisque eleifend donec pretium vulputate sapien nec sagittis aliquam malesuada', comments_counter: 0, likes_counter: 0, )

Comment.destroy_all

Comment.create(post: first_post, author: second_user, text: 'neque sodales ut etiam sit amet!' )
Comment.create(post: second_post, author: fifth_user, text: 'pellentesque elit eget gravida cum sociis natoque penatibus et magnis!' )
Comment.create(post: third_post, author: second_user, text: 'nulla posuere sollicitudin aliquam ultrices sagittis orci a scelerisque' )
Comment.create(post: fifth_post, author: second_user, text: 'sapien nec sagittis aliquam malesuada bibendum arcu vitae' )
Comment.create(post: sixth_post, author: second_user, text: 'euismod in pellentesque massa placerat duis ultricies' )
Comment.create(post: second_post, author: first_user, text: 'sagittis nisl rhoncus mattis rhoncus urna' )
Comment.create(post: first_post, author: fifth_user, text: 'velit aliquet sagittis id consectetur' )
Comment.create(post: fifth_post, author: fourth_user, text: 'etiam tempor orci eu' )
Comment.create(post: fourth_post, author: third_user, text: 'diam quis enim lobortis' )
Comment.create(post: sixth_post, author: first_user, text: 'in nibh mauris cursus mattis molestie a iaculis' )
Comment.create(post: sixth_post, author: fourth_user, text: 'lacus sed viverra tellus in' )

puts "Seeding done."
