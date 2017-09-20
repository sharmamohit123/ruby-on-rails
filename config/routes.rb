Rails.application.routes.draw do
  resources :questions
  resources :subgenres
  resources :genres
  get 'sessions/new'

  resources :users
  get 'pages/home'
  get 'pages/final_result'
  get 'pages/admin_home'
  get 'pages/start_quiz'
  get 'pages/show_result'
  get 'pages/resume'
  get 'pages/after_login'
  get '/admin_home', to: 'pages#admin_home'
  get '/users', to: 'users#index'
  get '/genres', to: 'genres#index'
  get '/subgenres', to: 'subgenres#index'
  get '/questions', to: 'questions#index'
  get '/attempt', to: 'pages#attempt'
  get '/no_attempt', to: 'pages#no_attempt'
  get '/pause', to: 'pages#pause'
  get '/history', to: 'pages#history'
  get '/home', to: 'pages#home'
  get '/contact', to: 'pages#contact'
  get '/show_board', to: 'pages#show_board'
  get '/leaderboard', to: 'pages#leaderboard'
  get '/subgenre_board', to: 'pages#subgenre_board'
  get '/genre_board', to: 'pages#genre_board'
  get '/select_subgenre', to: 'pages#show_subgenres'
  get '/quiz_questions', to: 'pages#show_questions'
  get '/start_quiz', to: 'pages#start_quiz'
  get  '/signup',  to: 'users#new'
  post '/signup', to: 'users#create'
  get '/play_quiz', to: 'pages#start_quiz'
  root 'pages#home'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  get    '/admin_login',   to: 'sessions#admin'
  post   '/admin_login',   to: 'sessions#admin_create'
  post   '/result',   to: 'pages#result'
  get   '/result',   to: 'pages#result'
  delete '/logout',  to: 'sessions#destroy'
  delete '/admin_logout',  to: 'sessions#admin_destroy'
  get 'auth/:provider', to: 'sessions#create_fb'
  get 'auth/failure', to: redirect('/')
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
