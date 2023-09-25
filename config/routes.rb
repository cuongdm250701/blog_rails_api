Rails.application.routes.draw do
  root to: 'ping#pong'
  get "ping" => 'ping#pong'
end
