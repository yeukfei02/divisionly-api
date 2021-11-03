Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'main#index'

  get '/api', to: 'main#index'

  scope '/api' do
    resources :users, only: %i[index show] do
      collection do
        post '/signup', to: 'users#signup'
        post '/login', to: 'users#login'
      end
      member do
        post '/change-password', to: 'users#change_password'
      end
    end

    resources :activities, only: [:index]
  end
end
