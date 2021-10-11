# == Route Map
#
#   Prefix Verb   URI Pattern             Controller#Action
#    tasks GET    /tasks(.:format)        tasks#index
#          POST   /tasks(.:format)        tasks#create
#     task GET    /tasks/:id(.:format)    tasks#show
#          PATCH  /tasks/:id(.:format)    tasks#update
#          PUT    /tasks/:id(.:format)    tasks#update
#          DELETE /tasks/:id(.:format)    tasks#destroy
# sessions POST   /sessions(.:format)     sessions#create
#  session DELETE /sessions/:id(.:format) sessions#destroy

Rails.application.routes.draw do
  # devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :tasks, only: [:index, :show, :create, :update, :destroy]

  resources :sessions, only: [:create, :destroy]
end
