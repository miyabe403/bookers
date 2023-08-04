Rails.application.routes.draw do
  root to: 'homes#top'
  # get '/books', to: 'books#new', as: 'books'
  resources :books  # resourcesメソッドは、ルーティングを一括して自動生成してくれる機能です。
end
