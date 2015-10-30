def question_choices(question)
  question.choices
end

def survey_questions(survey)
  survey.questions
end

def question_survey(question)
  question.survey
end

def survey_creator(survey)
  survey.user
end

def creatorAccess?(question)
  logged_in? && current_user.id == question_survey(question).creator_id
end
