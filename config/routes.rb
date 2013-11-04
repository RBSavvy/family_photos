Johnsonators::Application.routes.draw do

  resources :families do
    resources :albums do
      resources :photos
    end
  end

  get  'login'  => 'sessions#new'
  post 'login'  => 'sessions#create'
  get  'logout' => 'sessions#destroy'


  root to: 'main#index'


end
