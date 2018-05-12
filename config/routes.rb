Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users, :controllers => { :invitations => 'admin/invitations' }

  root to: 'articles#index'
  
  resources :articles, only: [:index, :show]

  resources :categories, only: [:index, :show]

  resources :groups, only: [:index, :show]

  namespace :admin do
    resources :articles
  end

  namespace :admin do
    resources :categories 
  end

  namespace :admin do
    resources :groups 
  end

  namespace :admin do
    resources :users 
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
