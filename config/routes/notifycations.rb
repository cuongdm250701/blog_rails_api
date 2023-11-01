resources :notifycations, only: [:index, :destroy, :show] do
    collection do
        put :change_status_read
    end
end