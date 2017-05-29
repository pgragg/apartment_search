Rails.application.routes.draw do
  root to: 'apartments#index'
  resources :apartments
  post 'recalculate', to: 'apartments#recalculate', as: 'recalculate'
  get '_ah/health', to: 'apartments#health_check'
  get 'ingest', to: 'apartments#ingest'
  post 'ingest', to: 'apartments#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
