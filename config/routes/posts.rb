resources :posts do 
    resources :comments
    resources :post_favorites, only: [:create, :destroy]
    collection do
        get :statistical_posts
    end
end