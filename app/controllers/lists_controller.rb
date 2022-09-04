class ListsController < ApplicationController
  def new #データの新規作成フォームを表示するアクション

    # Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する。
    @list = List.new #@list=インスタンス変数 List.new=空のモデル
  end

  def create #投稿を保存するためのcreateアクションを作成
    @list = List.new(list_params) # フォームに記述した文字やデータを受け取る＆受け取ったデータを元にインスタンスを作成する
     if @list.save # インスタンスにsaveメソッドを使いデータベースに保存する
      redirect_to list_path(@list.id)
    else
      #@lists = List.all #何も入力せず更新ボタンを押した場合、一覧ページに飛ぶ（そのための定義文）
      render :new #※ render :アクション名で、同じコントローラ内の別アクションのViewを表示できます
    end
        #redirect_to list_path(list.id) # トップ画面へリダイレクト
  end

  def index #一覧表示のためのアクション
    @lists = List.all #@lists=インスタンス変数
    #(あらかじめControllerのアクションでインスタンス変数を指定しておくことで、viewファイル上でインスタンス変数に格納された情報を表示させることができます。)
    #List.allとは・・・listsテーブルに保存されている全てのデータを取得することができます。
  end

  def show
    @list = List.find(params[:id]) #アクション内にparams[:id]と記述することで、詳細画面で呼び出される投稿データを URLの/lists/:id 内の:idで判別可能にする。
    #今回はレコードを1件だけ取得するので、インスタンス変数名は単数形の「@list」にします。
  end

  def edit #編集機能のためのアクション
    @list = List.find(params[:id]) #今回は投稿済みのデータ(保存されているデータ)を編集するので、findメソッドを用いて、データを取得します。
  end
  def update #更新機能のためのアクション
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to list_path(list.id) #データの更新後に更新結果を詳細画面(show)に表示するためにshowアクションにリダイレクトさせます
  end

  def destroy #削除機能のためのアクション
    list = List.find(params[:id])  # データ（レコード）を1件取得
    list.destroy  # データ（レコード）を削除
    redirect_to '/lists'  # 投稿一覧画面へリダイレクト
  end

  private
  # ストロングパラメータ(改竄データを送信した場合も、そのデータは保存される→脆弱性を防ぐ仕組みのこと)
  def list_params #list_params内では、保存したいデータの絞り込みが行われています。
    params.require(:list).permit(:title, :body, :image)
  end
end
