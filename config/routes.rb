Rails.application.routes.draw do
  root to: 'ping#pong'
  get "ping" => 'ping#pong'
  
  devise_for :users,
             controllers: {
              sessions: 'users/sessions',
              registrations: 'users/registrations',
              passwords: 'users/passwords'
            }
  resources :category_posts
end
