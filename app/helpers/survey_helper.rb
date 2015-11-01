def set_current_survey(survey)
  session[:survey_id]= survey.id
end

def current_survey
   if session[:survey_id]
      cur ||= Survey.find(session[:survey_id])
    end
    cur
end

def clear_current_survey
  session[:survey_id] = nil
end
