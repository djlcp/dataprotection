Rails.application.routes.draw do

  get 'home/index'

  scope module: 'frontend' do
    resources :home, only: [:index, :new, :create]
    root to: 'home#index'

    get 'contact-us', to: 'home#new', as: 'new_message'
    post 'contact-us', to: 'home#create', as: 'create_message'
    get 'regulations_dp' => 'home#regulations_dp'
    get 'authority_dp' => 'home#authority_dp'
    get 'dp_laws' => 'home#dp_laws'
    get 'search_all' => 'home#search_all'
    get 'home/terms_cond', to: 'home#terms_cond'

  end

  mount Ckeditor::Engine => '/ckeditor'

  devise_scope :user do
  get 'aubergine', to: 'devise/sessions#new'
end

  devise_for :users, :controllers => { :invitations => 'admin/invitations' }


  root to: 'articles#index'

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
