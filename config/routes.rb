Rails.application.routes.draw do
  post 'api/v1/movies' => 'api/v1/movie#create'
  get 'api/v1/movies/censure/:age' => 'api/v1/movie#show'
end
