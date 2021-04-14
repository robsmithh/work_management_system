Rails.application.routes.draw do


  # devise_for :users
  # devise_for :users, :controllers => {:users => "users_controller"}
  devise_for :user, :path => '', :path_names => { :sign_in => "login", :sign_out => "logout", :sign_up => "register" }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'pages#home'

  resources :contacts

end
