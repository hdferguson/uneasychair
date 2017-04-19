# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Conference.delete_all
Conference.create(name: 'First Conference', chairid: 3)
Conference.create(name: 'Second Conference', chairid: 1)
Conference.create(name: 'Third Conference', chairid: 2)

Committee.delete_all
Committee.create(name: 'People', conference_id: 1, user_id: 4)
Committee.create(name: 'Places', conference_id: 2, user_id: 4)
Committee.create(name: 'Things', conference_id: 3, user_id: 4)

Track.delete_all
Track.create(role: "Author", conference_id: 1, committee_id: 1, userid: 1, capproved: true, uapproved: true)
Track.create(role: "PC Member", conference_id: 1, committee_id: 1, userid: 2, capproved: true, uapproved: true)
Track.create(role: "PC Member", conference_id: 1, committee_id: 1, userid: 5, capproved: true, uapproved: true)
Track.create(role: "PC Member", conference_id: 1, committee_id: 1, userid: 6, capproved: true, uapproved: true)

Track.create(role: "Author", conference_id: 2, committee_id: 2, userid: 2, capproved: true, uapproved: true)
Track.create(role: "PC Member", conference_id: 2, committee_id: 2, userid: 3, capproved: true, uapproved: true)
Track.create(role: "PC Member", conference_id: 2, committee_id: 2, userid: 5, capproved: true, uapproved: true)
Track.create(role: "PC Member", conference_id: 2, committee_id: 2, userid: 6, capproved: true, uapproved: true)

Track.create(role: "Author", conference_id: 3, committee_id: 3, userid: 3, capproved: true, uapproved: true)
Track.create(role: "PC Member", conference_id: 3, committee_id: 3, userid: 1, capproved: true, uapproved: true)
Track.create(role: "PC Member", conference_id: 3, committee_id: 3, userid: 5, capproved: true, uapproved: true)
Track.create(role: "PC Member", conference_id: 3, committee_id: 3, userid: 6, capproved: true, uapproved: true)

Paper.delete_all
Paper.create(title: 'Why youtube is popular.', author: 'CB', 
    attachment: open('app/assets/files/learn-rails-1.pdf'), committee_id: 1, authorid: 1, rating: 9.30, accepted: false)
Paper.create(title: 'How to earn money', author: 'Heather Ferguson', 
    attachment: open('app/assets/files/learn-rails-2.pdf'), committee_id: 2, authorid: 2, rating: 5.78, accepted: false)
Paper.create(title: 'How to make a Website', author: 'Dustin Geohagan', 
    attachment: open('app/assets/files/agile-web-development-with-rails-5_p1_0.pdf'), committee_id: 3, authorid: 3, rating: 2.75, accepted: false)


Review.delete_all
Review.create(score: 10, comments: 'It is okay to be a coward, if you win. ', paper_id: 1, confidence: 5, memberid: 2)
Review.create(score: 9, comments: 'Born to be Kings!', paper_id: 1,confidence: 3, memberid: 5)
Review.create(score: 8, comments: 'We are the Princes of the Universe!', paper_id: 1, confidence: 2, memberid: 6)

Review.create(score: 7, comments: 'Here we stand or here we fall!', paper_id: 2, confidence: 2, memberid: 3)
Review.create(score: 6, comments: 'History wont care at all.', paper_id: 2, confidence: 3, memberid: 5)
Review.create(score: 5, comments: 'For Daisy!', paper_id: 2, confidence: 4, memberid: 6)

Review.create(score: 4, comments: 'Here we are!', paper_id: 3, confidence: 1, memberid: 1)
Review.create(score: 3, comments: 'Just do it!', paper_id: 3, confidence: 4, memberid: 5)
Review.create(score: 2, comments: 'Love is a battlefield', paper_id: 3, confidence: 3, memberid: 6)
