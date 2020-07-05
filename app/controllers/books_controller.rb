class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_book, only: [:update, :destroy]

  def index
    @books = Book.all

    @user = User.find(current_user.id)
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
    @user = User.find(current_user.id)
  end

  def edit
    @book = Book.find(params[:id])
    redirect_to action: :index, notice: '' if @book.user.id != current_user.id
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id

    if @book.save
      redirect_to @book, notice: 'Book was successfully created.'
    else
      @user = User.find(current_user.id)
      render "users/show"
    end
  end

  def update
    if @book.update(book_params)
      redirect_to @book, notice: 'Book was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @book.destroy
    redirect_to books_url, notice: 'Book was successfully destroyed.'
  end

  private
    def set_book
      @book = Book.where(id: params[:id], user_id: current_user.id).first!
    end

    def book_params
      params.require(:book).permit(:title, :body)
    end
end
