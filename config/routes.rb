Basecamp::Application.routes.draw do

  resources :projects do
    resources :lists
  end

  resources :lists do
    resources :items
  end

  resources :projects do
    resources :memberships
  end

  devise_for :users


  root :to => 'projects#index'

end
