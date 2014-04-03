Member::Engine.routes.draw do
  resources :publications
  
  get "profiles/index"
  
  root "profiles#index"
end
