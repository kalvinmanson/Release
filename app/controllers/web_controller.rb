class WebController < ApplicationController
	def index
		@last_books = Book.all
	end

end
