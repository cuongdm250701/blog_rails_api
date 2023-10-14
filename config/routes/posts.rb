resources :posts do 
    resources :comments
    resources :post_favorites, only: [:create, :destroy]
end