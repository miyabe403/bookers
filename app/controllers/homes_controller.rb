class HomesController < ApplicationController
  def top
  end
  
  def index
    @book = Book.all  # allメソッドを使ってデータベース内のデータを全て取得する
  end
end
