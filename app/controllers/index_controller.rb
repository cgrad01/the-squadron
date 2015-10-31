get "/" do
  surveys = Survey.all
  erb :'index', locals: {surveys: surveys}
end


