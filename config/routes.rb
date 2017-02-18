Rails.application.routes.draw do
  root to: 'apartments#index'
  resources :apartments
  post 'recalculate', to: 'apartments#recalculate', as: 'recalculate'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
