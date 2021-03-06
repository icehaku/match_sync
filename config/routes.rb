Rails.application.routes.draw do
  get 'replays/index'

  get 'replays/new'

  get 'replays/create'

  get 'replays/destroy'

  resources :replays, only: [:index, :new, :create, :destroy]

  root 'welcome#index'
  get  'welcome/index'
  post 'auth/steam/callback' => 'welcome#auth_callback'
  get '/logout', to: 'welcome#logout'

  resources :matches do
    collection do
      get :status_update
      get :enter_slot
      get :clear_slot
    end
  end

end
