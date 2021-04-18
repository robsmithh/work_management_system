Rails.application.routes.draw do

  devise_for :user, :path => '', :path_names => { :sign_in => "login", :sign_out => "logout", :sign_up => "register" }

  root to: 'pages#home'

  resources :contacts

  resources :work_requests


  resources :data_submissions, except: [:index, :destroy]

end
