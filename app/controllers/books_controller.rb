class BooksController < ApplicationController
  def new
    # Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する。
    @book = Book.new
  end
  
  def create
    # １.&2. データを受け取り新規登録するためのインスタンス作成
    @book = Book.new(book_params)
    if @book.save  # 3. データが入力されていればデータをデータベースに保存するためのsaveメソッド実行
      # 4. フラッシュメッセージを定義し、詳細画面へリダイレクト
      flash[:notice] = "投稿に成功しました。"
      redirect_to book_path(@book.id)  # 「転送したいアクションへのURL」を指定します。
    else  # データが入力されていなければ、saveメソッドでfalseが返されます。
      # 4. flash.nowでフラッシュメッセージを定義し、new.html.erbを描画する
      flash.now[:alert] = "投稿に失敗しました。"  #キーをalertに変更
      render :new  #  render :アクション名で、同じコントローラ内の別アクションのViewを表示できます。　
    end
  end
  
  def destroy
    book = Book.find(params[:id])  # データ(レコード) を1件取得
    book.destroy  # データ(レコード)を削除
    redirect_to '/books'  # 投稿一覧画面へリダイレクト
  end
    
  def index
    @books = Book.all  # allメソッドを使ってデータベース内のデータを全て取得する
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])  # URLが/books/1の場合、params[:id] と記述すると、id=1を取り出せます。
  end

  def edit
    @book = Book.find(params[:id])  # 投稿済みのデータを編集するので、保存されているデータを取得します。
  end
  
  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
  end
  
  private
  # ストロングパラメータ  投稿機能
  def book_params
    params.require(:book).permit(:title, :body)  # title,bodyのデータの取得を許可します。
  end
end