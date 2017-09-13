Rails.application.routes.draw do
  resources :rules
  root to: "rules#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
