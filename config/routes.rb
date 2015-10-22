Rails.application.routes.draw do
  root 'articles#index'
  get 'articles/token', to: 'articles#token'
  resources :articles
  resources :article_categories
end
