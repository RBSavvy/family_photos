Johnsonators::Application.routes.draw do
  root to: 'main#index'
  resources :photos

end
