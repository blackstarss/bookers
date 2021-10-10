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

  
  private
   def book_params
     params.require(:book).permit(:title, :body)
   end
  
  
end
