# namespace :db do
#     desc 'Generate fake data'
#     task generate_fake_data: :environment do
#       require 'faker'
  
#       # Generate fake users
#       posts = []
#       10.times do
#         post = Post.create!(
#           username: Faker::Internet.unique.username,
#         #   name: Faker::Name.name,
#           bio: Faker::Lorem.sentence,
#         #   avatar_url: Faker::Avatar.image
#         )
#         posts << user
#       end
  
      # Generate fake posts
    #   posts.each do |post|
    #     5.times do
    #       post = post.posts.create!(
    #         caption: Faker::Lorem.sentence,
    #         image_url: Faker::Placeholdit.image(size: '300x300')
    #       )
          
    #       # Generate fake likes for posts
    #       rand(1..10).times do
    #         post_id = posts.sample.id
    #         post.likes.create!(post_id: post_id) unless post.likes.exists?(post_id: post_id)
    #       end
    #     end
    #   end
  
      # Generate fake followers
  #     posts.each do |post|
  #       followers = posts.sample(3)
  #       followers.each do |follower|
  #         follower.following << post unless follower.following.include?(post)
  #       end
  #     end
  
  #     puts 'Fake data generated successfully!'
  #   end
  # end
  


# namespace :db do
#     desc 'Generate fake data'
#     task generate_fake_data: :environment do
#       require 'faker'
  
#       # Generate fake users
#       10.times do
#         User.create!(
#           username: Faker::Internet.unique.username,
#           name: Faker::Name.name,
#           bio: Faker::Lorem.sentence,
#           avatar_url: Faker::Avatar.image
#         )
#       end
  
#       # Generate fake posts
#       User.all.each do |user|
#         5.times do
#           user.posts.create!(
#             caption: Faker::Lorem.sentence,
#             image_url: Faker::Placeholdit.image(size: '300x300')
#           )
#         end
#       end
  
#       puts 'Fake data generated successfully!'
#     end
#   end
  