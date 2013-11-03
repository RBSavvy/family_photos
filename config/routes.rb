Johnsonators::Application.routes.draw do
  resources :albums do
    resources :photos
  end

  root to: 'main#index'


end
