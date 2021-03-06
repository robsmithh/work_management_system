Rails.application.routes.draw do

  devise_for :user, :path => '', :path_names => { :sign_in => "login", :sign_out => "logout", :sign_up => "register" }

  root to: 'pages#home'

  resources :contacts

  resources :work_requests

  post '/work_requests/:id', to: "work_requests#accept_request"

  post '/reject', to: 'work_requests#reject_request'

  get '/awaiting_approval', to: 'work_requests#awaiting_approval'

  get '/summary', to: 'work_requests#summary'

  get '/change_status/:id', to: 'work_requests#change_status'

  resource :notes, except: [:index, :destroy, :show, :update]

  resources :data_submissions, except: [:index, :destroy]

  resources :notifications, except: [:destroy, :show]

end
