Basecamp::Application.routes.draw do

  resources :projects do
    resources :lists
  end
  devise_for :users


  root :to => 'projects#index'

end
