Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :posts, only: %i[create show]
  root 'home#index'
  get '/check.txt', to: proc { [200, {}, ['it_works']] }
end
