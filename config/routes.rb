Basecamp::Application.routes.draw do
  resources :projects
  devise_for :users


  root :to => 'projects#index'

end
