Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/rails_admin', as: 'rails_admin'
  devise_for :users
  resources :users do
    collection do
      get :mailings, to: 'users#mailings'
    end
  end

  root to: 'users#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
