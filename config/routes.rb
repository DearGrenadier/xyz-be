# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :posts, except: %i[new edit]
  resource :auth, only: :show, controller: :auth

  root 'home#index'
  get '/check.txt', to: proc { [200, {}, ['it_works']] }
end
