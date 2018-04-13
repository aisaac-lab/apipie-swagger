Rails.application.routes.draw do
  get 'api-docs', to: 'api_docs#index'
  apipie
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :todos do
    resources :items
  end
end
