
resources :category_posts do
    resources :posts do 
        member do
            put :post_approval
        end
    end
end