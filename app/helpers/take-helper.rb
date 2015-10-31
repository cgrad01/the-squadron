def user_has_taken?(survey)
  responses = survey.responses
  responses.each do |response|
    if response.taker_id == session[:user_id]
      return true
    end
  end
  return false
end
