Rails.application.routes.draw do
  # Devise setup
  devise_for :users, :controllers => {:registrations => "registrations"}
  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    get 'signup', to: 'devise/registrations#new'
  end
  # Home page
  root to: 'pages#index'
  # Post routes
  resources :posts do
    collection do
      get 'hobby'
      get 'study'
      get 'team'
    end
  end
end
