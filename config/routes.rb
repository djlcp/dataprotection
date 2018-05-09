Rails.application.routes.draw do

  get 'home/index'

  scope module: 'frontend' do
    resources :home, only: :index
    root to: 'home#index'
  end

  root to: 'articles#index'
  resources :articles
  resources :categories
  resources :groups
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  

end
