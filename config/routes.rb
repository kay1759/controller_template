Rails.application.routes.draw do
  resources :blog_posts
  resources :people
  resources :blogs
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
