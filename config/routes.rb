Rails.application.routes.draw do
 #以下はnew(新規作成)のルーティング設定
 # get 'lists/new'
 # post 'lists' => 'lists#create' #データを追加するためのルーティングをここで設定

 #以下はindex(データ一覧)のルーティング設定
 # get 'lists' => 'lists#index'

 #以下はshow(データの詳細)のルーティング設定
 # get 'lists/:id' => 'lists#show',as: 'list'
 #どの投稿データを表示するかを判別するために、投稿データのidもURLに含めます。
 #as:オプションを追加することで、「'lists#show'の設定を、listとして利用できる」


 #以下はedit(データを編集するフォーム)のルーティング設定
 # get 'lists/:id/edit' => 'lists#edit', as: 'edit_list'

  #以下はupdate(データを更新するフォーム)のルーティング設定
  # patch 'lists/:id' => 'lists#update', as: 'update_list'
  #更新の場合はPATCHで指定します

  #以下はdestroy(データを削除するフォーム)のルーティング設定
  # delete 'lists/:id' => 'lists#destroy', as: 'destroy_list'

  #以下はホーム画に戻るルーティング設定
  get '/top' => 'homes#top' #URLに「/top」を追加することでホーム画面に戻るルーティング設定

  resources :lists#ルーティングを自動作成

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
