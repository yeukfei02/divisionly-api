Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'main#index'

  get '/api', to: 'main#index'

  scope '/api' do
    post '/users/signup', to: 'users#signup'
    post '/users/login', to: 'users#login'
    get '/users', to: 'users#get_users'
    get '/users/:id', to: 'users#get_user_by_id'
  end
end
