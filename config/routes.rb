Rails.application.routes.draw do

  get 'home/index'

  scope module: 'frontend' do
    resources :home, only: :index
    root to: 'home#index'
  end

  devise_for :users, :controllers => { :invitations => 'admin/invitations' }

  # root to: 'articles#index'
  
  resources :articles, only: [:index, :show]

  resources :categories, only: [:index, :show]

  resources :groups, only: [:index, :show]

  namespace :admin do
    resources :articles
    resources :categories 
    resources :groups
    resources :users 
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  

end
