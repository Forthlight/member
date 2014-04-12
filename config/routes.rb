Member::Engine.routes.draw do
  resources :publications, :profiles

  root "profiles#index"
end
