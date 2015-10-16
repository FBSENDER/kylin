Rails.application.routes.draw do
  root 'article#tasks'
  get 'article/edit/:id', to: 'article#edit'
  post 'article/edit_finish', to: 'article#finish'
  get 'article/token', to: 'article#token'
  get 'article/upload', to: 'article#upload'
end
