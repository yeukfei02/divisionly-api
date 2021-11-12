require 'sidekiq/web'
require 'sidekiq/cron/web'

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  mount Sidekiq::Web => '/sidekiq'

  root 'main#index'

  get '/api', to: 'main#index'

  scope '/api' do
    resources :users, only: %i[index show] do
      collection do
        post '/signup', to: 'users#signup'
        post '/login', to: 'users#login'
        post '/upload', to: 'users#upload'
      end
      member do
        post '/change-password', to: 'users#change_password'
      end
    end

    resources :groups, only: %i[create index show update] do
      collection do
        post '/remove', to: 'groups#remove_group'
      end
    end

    resources :friends, only: %i[create index show update] do
      collection do
        post '/remove', to: 'friends#remove_friend'
      end
    end

    resources :expenses, only: %i[create index show update] do
      collection do
        post '/remove', to: 'expenses#remove_expense'
      end
    end

    resources :activities, only: %i[index show]

    resources :expense_categories, only: %i[index]

    resources :currencies, only: %i[index]

    resources :countries, only: %i[index]

    scope '/files' do
      post '/upload', to: 'files#upload'
    end
  end
end
