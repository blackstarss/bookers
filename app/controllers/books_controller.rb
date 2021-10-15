class BooksController < ApplicationController
  
  def index
    @book = Book.new
    @books = Book.all
    
  end

  def show
    @book = Book.find(params[:id])
  end



  def edit
    @book = Book.find(params[:id])
  end
  
  def create
    book = Book.create(book_params)
    
    redirect_to book_path(book)
    
  end
  
  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to books_path
  end
  
  def  destroy
    book = Book.find(params[:id])
    # データ（レコード）を1件取得
    book.destroy  # データ（レコード）を削除
    redirect_to books_path  # 投稿一覧画面へリダイレクト
    
  end

  
  private
   def book_params
     params.require(:book).permit(:title, :body)
   end
  
  
end
