Rails.application.routes.draw do
  post 'api/v1/movie' => 'api/v1/movie#create'
  get 'api/v1/movie/censure/:age' => 'api/v1/movie#show'
end
