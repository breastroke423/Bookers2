class BooksController < ApplicationController


def create
	book = Book.new(book_params)
	book.user_id = current_user.id
	book.save
	redirect_to books_path

end

def index
	@book = Book.new
	@books = Book.all
	@user = current_user

end

def show
	@book = Book.new
	@books = Book.all
	@user = User.find(params[:id])

end



def edit
	@book = Book.find(params[:id])
	@user = User.find(params[:id])

end

def destroy
	@book = Book.find(params[:id])
	@book.destroy
	redirect_to book_path
end

def update
	book = Book.find(params[:id])
	book.update(book_params)
	redirect_to book_path
	
end

def about
	
end



private
	def book_params
		params.require(:book).permit(:title, :body)
	end
end
