class UsersController < ApplicationController

	before_action :authenticate_user!

	def show
		@user = User.find(params[:id])
		@book = Book.new
		@books = @user.books
	end

	def index
		@book = Book.new
		@users = User.all
		@user = current_user
	end

	def edit
		# @book = Book.find(params[:id])
		@user = User.find(params[:id])
		if @user != current_user
			redirect_to user_path(current_user)
		end
	end

	def update
		# book = book.find(params[:id])
		# book.update(book_params)
		# redirect_to book_path
		@user = User.find(params[:id])
		if @user.update(user_params)
			flash[:notice] = 'You have updated book successfully.'
			redirect_to user_path(@user.id)
		else
			render "edit"
		end
	end


	private
	def book_params
		params.require(:book).permit(:title, :body)
	end
	def user_params
		params.require(:user).permit(:name, :introduction, :profile_image )
	end


end
