class WebController < ApplicationController
	def index
		@genders = Gender.all
		@last_books = Book.order('created_at DESC').limit(40)
	end
end
