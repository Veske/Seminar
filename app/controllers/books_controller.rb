class BooksController < ApplicationController

	def index
		@books = Book.all
	end

	def create
		@book = Book.create(book_params)
		if @book.save
			redirect_to books_path
		else
			redirect_to new_book_path
		end
	end

	def show
		@book = Book.find(params[:id])
	end

	def new
		@book = Book.new
	end

	def edit
		@book = Book.find(params[:id])
	end

	def update
		@book = Book.find(params[:id])
		if @book.update(book_params)
			redirect_to @book
		else
			render :index
		end
	end

	def destroy
		Book.find(params[:id]).destroy
		redirect_to books_path
	end

	private
		def book_params
			params.require(:book).permit(:name, :published, :author)
		end
end