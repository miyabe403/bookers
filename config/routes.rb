Rails.application.routes.draw do
  # get 'books/new'
  root to: 'homes#top'
  post 'books' => 'books#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
