Rails.application.routes.draw do
  resources :themas
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :rules
  resources :users
  devise_scope :user do
    root :to => "devise/sessions#new"
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
