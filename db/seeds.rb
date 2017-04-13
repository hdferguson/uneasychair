# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Conference.delete_all
Conference.create(name: 'First Conference', chairid: 4)
Conference.create(name: 'Second Conference', chairid: 4)
Conference.create(name: 'Third Conference', chairid: 2)

Paper.delete_all
Paper.create(title: 'How do I shot Web', author: 'CB', 
    attachment: open('app/assets/files/learn-rails-1.pdf'), conference_id: 1, authorid: 1, rating: 0, accepted: false)
Paper.create(title: 'How to earn money', author: 'Heather Ferguson', 
    attachment: open('app/assets/files/learn-rails-2.pdf'), conference_id: 2, authorid: 2, rating: 0, accepted: false)
Paper.create(title: 'How to make a Website', author: 'Dustin Geohagan', 
    attachment: open('app/assets/files/agile-web-development-with-rails-5_p1_0.pdf'), conference_id: 2, authorid: 3, rating: 0, accepted: false)
Paper.create(title: 'Derp', author: 'Testing', 
    attachment: open('app/assets/files/rails-bootstrap.pdf'), conference_id: 3, authorid: 4, rating: 0, accepted: false)


Review.delete_all
Review.create(score: 10, comments: 'Here we are!', paper_id: 1, confidence: 2, memberid: 2)
Review.create(score: 9, comments: 'Born to be Kings!', paper_id: 1,confidence: 2, memberid: 2)
Review.create(score: 8, comments: 'We are the Princes of the Universe!', paper_id: 1, confidence: 2, memberid: 3)
#Review.create(score: 8, comments: 'Here We belong!', paper_id: 1, confidence: 2, mememberid: 2)
#Review.create(score: 4, comments: 'Fighting to survive in a war with the darkest powers!', paper_id: 1, confidence: 2, mememberid: 3)

#Review.create(score: 7, comments: 'Here we stand or here we fall!', paper_id: 2)
#Review.create(score: 6, comments: 'History wont care at all', paper_id: 2)
#Review.create(score: 5, comments: 'Make the bed! Light the light', paper_id: 2)
#Review.create(score: 7, comments: 'Lady Mercy wont be home tonight', paper_id: 2)

#Review.create(score: 4, comments: 'She keeps a Moet et Chandon In her pretty cabinet', paper_id: 3)
#Review.create(score: 3, comments: 'Let them eat cake, she says, Just like Marie Antoinette', paper_id: 3)
#Review.create(score: 2, comments: 'A built-in remedy for Kruscheb and Kennedy', paper_id: 3)
#Review.create(score: 6, comments: 'At anytime an invitation You cant decline', paper_id: 3)

#Review.create(score: 1, comments: 'Im taking my time with destiny willing to play my part', paper_id: 4)
#Review.create(score: 10, comments: 'Living with painful memories Loving with all my heart', paper_id: 4)
#Review.create(score: 9, comments: 'Made in heaven, made in heaven, It was all meant to be, yeah', paper_id: 4)
#Review.create(score: 5, comments: 'Made in heaven, made in heaven, thats wahat they say!', paper_id: 4)
