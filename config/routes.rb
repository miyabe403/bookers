Rails.application.routes.draw do
  root to: 'homes#top'
  # get '/books', to: 'books#new', as: 'books'
  # resources :books  # resourcesメソッドは、ルーティングを一括して自動生成してくれる機能です。
  # get '/books/index' => 'books#index'

  get 'books/new'
  post 'books' => 'books#create'
  get 'books' => 'books#index'
  # .../lists/1 や .../lists/3 に該当する
  get 'books/:id' => 'books#show', as: 'book'  # 名前付きルート as:オプションを追加「'lists#show'の設定を、listとして利用できる」
  get 'books/:id/edit' => 'books#edit', as: 'edit_book'  # URLに:idを用いて記述すると、lists/◯◯/editのすべてのURLが対象になります。
  patch 'books/:id' => 'books#update', as: 'update_book'  # 更新の場合はPATCHで指定します。
  delete 'books/:id' => 'books#destroy', as: 'destroy_book'  # HTTPメソッドはDELETE、URLはlists/:idです。名前付きパスは、destroy_listと設定します。
end
