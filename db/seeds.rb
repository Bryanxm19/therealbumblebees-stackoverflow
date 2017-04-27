50.times do
  User.create(username: Faker::Internet.user_name, email: Faker::Internet.safe_email, password: 'test')
end

50.times do
  Question.create(title: (Faker::Hipster.sentence(2).chop + "?"), body: (Faker::Hipster.sentence(5).chop + "?"), user_id: rand(50))
end

100.times do
  Answer.create(text: Faker::Hacker.say_something_smart, user_id: rand(50), question_id: rand(50))
end

500.times do
  Vote.create(user_id: rand(50), votable_id: rand(50), votable_type: ["Question", "Answer"].sample, up_down: ["up", "down"].sample)
end
