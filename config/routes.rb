# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :posts, except: %i[new edit]
  resource :auth, only: :show, controller: :auth
  resources :cvs, only: %i[index create destroy]

  root 'home#index'
  get '/check.txt', to: proc { [200, {}, ['it_works']] }
end

Rails.application.routes.default_url_options[:host] = ENV.fetch('HOST_URL', 'localhost:8080')
