Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'pages#home'

  get '/contact', to: 'contacts#contact'
  get '/contact/new', to: 'contacts#new'
  patch '/contact/:id', to: 'contacts#edit'
  delete '/contact/:id', to: 'contacts#destroy'



end
