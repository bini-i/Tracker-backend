# == Route Map
#
#                   Prefix Verb   URI Pattern                         Controller#Action
#         new_user_session GET    /users/sign_in(.:format)            devise/sessions#new
#             user_session POST   /users/sign_in(.:format)            devise/sessions#create
#     destroy_user_session DELETE /users/sign_out(.:format)           devise/sessions#destroy
#        new_user_password GET    /users/password/new(.:format)       devise/passwords#new
#       edit_user_password GET    /users/password/edit(.:format)      devise/passwords#edit
#            user_password PATCH  /users/password(.:format)           devise/passwords#update
#                          PUT    /users/password(.:format)           devise/passwords#update
#                          POST   /users/password(.:format)           devise/passwords#create
# cancel_user_registration GET    /users/cancel(.:format)             devise/registrations#cancel
#    new_user_registration GET    /users/sign_up(.:format)            devise/registrations#new
#   edit_user_registration GET    /users/edit(.:format)               devise/registrations#edit
#        user_registration PATCH  /users(.:format)                    devise/registrations#update
#                          PUT    /users(.:format)                    devise/registrations#update
#                          DELETE /users(.:format)                    devise/registrations#destroy
#                          POST   /users(.:format)                    devise/registrations#create
#               task_todos GET    /tasks/:task_id/todos(.:format)     todos#index
#                task_todo PATCH  /tasks/:task_id/todos/:id(.:format) todos#update
#                          PUT    /tasks/:task_id/todos/:id(.:format) todos#update
#                          DELETE /tasks/:task_id/todos/:id(.:format) todos#destroy
#                    tasks GET    /tasks(.:format)                    tasks#index
#                          POST   /tasks(.:format)                    tasks#create
#                     task GET    /tasks/:id(.:format)                tasks#show
#                          PATCH  /tasks/:id(.:format)                tasks#update
#                          PUT    /tasks/:id(.:format)                tasks#update
#                          DELETE /tasks/:id(.:format)                tasks#destroy
#                 sessions POST   /sessions(.:format)                 sessions#create
#                  session DELETE /sessions/:id(.:format)             sessions#destroy

Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :tasks do
    resources :todos, only: [:index, :update, :destroy]
  end 

  resources :sessions, only: [:create, :destroy]
end
