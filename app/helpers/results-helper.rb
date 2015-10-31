def tally_results(results)
  all_answers = []
  results.each do |result|
    all_answers << result.choice.text
  end
  hashed_answers = {}
  total_responses = all_answers.length
  all_answers.each do |answer|
    if hashed_answers[answer] == nil
      hashed_answers[answer] = 1
    else
      hashed_answers[answer] += 1
    end
  end
  hashed_answers

end


def count_question_responses(choices)
  responses = []
  choices.each do |choice|
    responses << choice.responses.length
  end
  responses.reduce(:+)
end
