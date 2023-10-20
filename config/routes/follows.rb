resources :follows, only: [:create, :destroy, :index] do
    collection do
        put :receive_notifycation
    end
end