Course::Application.routes.draw do
  get ':course/:number' => 'content#show'
  get ':course/:number/progress' => 'progress#show'
  post ':course/:number' => 'submissions#create'
end
