Rails.application.routes.draw do
  get '/articles', to: 'article#index'
end
