Rails.application.routes.draw do
  resources :questions
  resources :subgenres
  resources :genres
  get 'sessions/new'

  resources :users
  get 'pages/home'
  get 'pages/final_result'
  get 'pages/start_quiz'
  get 'pages/show_result'
  get 'pages/resume'
  get '/select_subgenre', to: 'pages#show_subgenres'
  get '/quiz_questions', to: 'pages#show_questions'
  get '/start_quiz', to: 'pages#start_quiz'
  get  '/signup',  to: 'users#new'
  post '/signup', to: 'users#create'
  get '/play_quiz', to: 'pages#start_quiz'
  root 'pages#home'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  post   '/result',   to: 'pages#result'
  get   '/result',   to: 'pages#result'
  delete '/logout',  to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
