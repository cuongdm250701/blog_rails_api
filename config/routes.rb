Rails.application.routes.draw do

  def draw(routes_name)
    instance_eval(File.read(Rails.root.join("config/routes/#{routes_name}.rb")))
  end

  root to: 'ping#pong'
  get "ping" => 'ping#pong'
  get 'my_posts' => 'posts#my_posts'
  devise_for :users,
             controllers: {
              sessions: 'users/sessions',
              registrations: 'users/registrations',
              passwords: 'users/passwords'
            }
  draw(:category_posts)
  
end
