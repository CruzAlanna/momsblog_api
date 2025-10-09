User.create(first_name: "Alanna", last_name: "Cruz", email: "lanna@mail.com", username: "CruzAlanna", password: "pass", password_confirmation: "pass")
User.create(first_name: "Elijah", last_name: "Quichocho", email: "elijah@mail.com", username: "QElijah", password: "pword", password_confirmation: "pword")
User.create(first_name: "Carmen", last_name: "Quichocho", email: "mamie@mail.com", username: "QCarmen", password: "babyy", password_confirmation: "babyy")

Post.create(title: "Seeding Data", author: "Alanna Cruz", content: "Hello everybody, this is a seeded post. I created this so that I can test out my controllers and routes using HTTPie. I like to have data already in the database when starting my server up.", user_id: 1)
Post.create(title: "TV Obsession", author: "Carmen Quichocho", content: "Hello everybody, this is a seeded post. Mamie's favorite programs to watch are Frozen, Moana, Moana 2, Mickey Mouse Clubhouse, Spiderman, Coco, and Lilo and Stitch.", user_id: 3)
Post.create(title: "About Me", author: "Elijah Quichocho", content: "Hello everybody, this is a seeded post. Fun facts about Elijah: 1. He loves to collect quality kitchen knives. 2. He enjoys cooking, 3. He loves wrestling and is a coach for GW.", user_id: 2)

Comment.create(author: "Alanna Cruz", content: "Wow those are all really good programs, my favorite would be Coco!", user_id: 1, post_id: 2)
Comment.create(author: "Elijah Quichocho", content: "Mamie I love you!", user_id: 2, post_id: 2)
Comment.create(author: "Carmen Quichocho", content: "Babyyyyy! Chicken! Thank you, You're Welcome!", user_id: 3, post_id: 3)

puts "#{User.count} user(s), #{Post.count} post(s), and #{Comment.count} comment(s) created successfully"
