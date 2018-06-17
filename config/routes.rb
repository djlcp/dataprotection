Rails.application.routes.draw do

  get 'home/index'

  namespace :frontend do
    resources :articles
  end

  scope module: 'frontend' do
    resources :home, only: :index
    root to: 'home#index'

    get 'regulations_dp' => 'home#regulations_dp'
    get 'authority_dp' => 'home#authority_dp'
    get 'dp_laws' => 'home#dp_laws'

  end

  mount Ckeditor::Engine => '/ckeditor'

  devise_scope :user do
    get 'aubergine', to: 'devise/sessions#new'
  end

  devise_for :users, :controllers => { :invitations => 'admin/invitations' }


  root to: 'articles#index'

  resources :articles, only: [:index]

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
