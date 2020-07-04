Rails.application.routes.draw do
  resources module: 'api' do
    resources module: 'v1' do
      resources :movie do
        post 'movie', :on => :collection
      end
    end
  end
end
