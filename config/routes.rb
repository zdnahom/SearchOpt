Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      post '/search', to: 'search_queries#search'
      get '/get_suggestions', to: 'search_queries#get_suggestions'
      end
    end
end
