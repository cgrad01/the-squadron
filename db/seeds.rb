require 'faker'

# Seed users
User.create!(name: "rachel", password: "password")
User.create!(name: "corey", password: "password")
User.create!(name: "nick", password: "password")
User.create!(name: "jon", password: "password")

# Seed surveys
4.times do
  Survey.create!(
    title: Faker::Book.title,
    creator_id: rand(1..4),
    )
end

# Seed questions
surveys = Survey.all

for survey in surveys
  5.times do
  Question.create!(
    text: "#{Faker::Lorem.sentence}?",
    survey_id: survey.id,
    )
  end
end

# Seed choices
questions = Question.all

questions.each do |question|
  2.times do Choice.create!(
    text: Faker::Lorem.words,
    question_id: question.id,
    )
  end
end

# Seed responses
for survey in surveys
  Response.create!(
    taker_id: survey.creator_id,
    choice_id: Choice.find_by(question_id: Question.find_by(survey_id: survey.id).id).id,
    survey_id: survey.id,
    )
end

















