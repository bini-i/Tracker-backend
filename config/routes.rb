# frozen_string_literal: true

# == Route Map
#
#                   Prefix Verb   URI Pattern                    Controller#Action
#         new_user_session GET    /users/sign_in(.:format)       devise/sessions#new
#             user_session POST   /users/sign_in(.:format)       devise/sessions#create
#     destroy_user_session DELETE /users/sign_out(.:format)      devise/sessions#destroy
#        new_user_password GET    /users/password/new(.:format)  devise/passwords#new
#       edit_user_password GET    /users/password/edit(.:format) devise/passwords#edit
#            user_password PATCH  /users/password(.:format)      devise/passwords#update
#                          PUT    /users/password(.:format)      devise/passwords#update
#                          POST   /users/password(.:format)      devise/passwords#create
# cancel_user_registration GET    /users/cancel(.:format)        devise/registrations#cancel
#    new_user_registration GET    /users/sign_up(.:format)       devise/registrations#new
#   edit_user_registration GET    /users/edit(.:format)          devise/registrations#edit
#        user_registration PATCH  /users(.:format)               devise/registrations#update
#                          PUT    /users(.:format)               devise/registrations#update
#                          DELETE /users(.:format)               devise/registrations#destroy
#                          POST   /users(.:format)               devise/registrations#create
#                    tasks GET    /tasks(.:format)               tasks#index
#                          POST   /tasks(.:format)               tasks#create
#                     task GET    /tasks/:id(.:format)           tasks#show
#                          PATCH  /tasks/:id(.:format)           tasks#update
#                          PUT    /tasks/:id(.:format)           tasks#update
#                          DELETE /tasks/:id(.:format)           tasks#destroy
#                 sessions POST   /sessions(.:format)            sessions#create
#                  session DELETE /sessions/:id(.:format)        sessions#destroy
#                 accounts POST   /accounts(.:format)            accounts#create

Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :tasks, only: %i[index show create update destroy]

  resources :sessions, only: %i[create destroy]
  resources :accounts, only: [:create]
end
