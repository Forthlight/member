Member::Engine.routes.draw do
  devise_for :users, {
    class_name: "Member::User", 
    module: :devise,
    :controllers => { :sessions => "member/sessions" }
  }

  resources :publications
  
  get "profiles/index"
  
  root "profiles#index"
end
