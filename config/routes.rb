Rails.application.routes.draw do
  resources :users
  resources :user_categories, except: [:show]
  resources :categories
  resources :articles

  get '/user_articles/:user_id', to: 'articles#user_articles'
  get '/user_categories/:user_id', to: 'user_categories#user_categories'
  post '/login', to: 'auth#create'
  post '/signup', to: 'users#create'
  delete '/logout', to: 'auth#delete'
end
