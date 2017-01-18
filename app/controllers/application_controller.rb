class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception

	before_filter :configure_permitted_parameters, if: :devise_controller?

	before_action :set_locale
	before_action :generalvariables

	#solo administrador
	WillPaginate.per_page = 24

 
	def set_locale
	  I18n.locale = params[:locale] || I18n.default_locale
	end

	def default_url_options
	  { locale: I18n.locale }
	end

	def generalvariables
	    @navgenders = Gender.all
	    if current_user.present?
	    	@unread_messages = current_user.mailbox.inbox({:read => false}).count
	    else
	    	@unread_messages = 0
		end
	end

	rescue_from CanCan::AccessDenied do |exception|
		if request.env["HTTP_REFERER"].present? and request.env["HTTP_REFERER"] != request.env["REQUEST_URI"]
			redirect_to :back, :alert => exception.message
		else
			redirect_to root_path, :alert => exception.message
		end
	end

	#Generar notificacion
	def notification n = {}
		#invoque notification(:book_id => @book.id, :content => "Nuevo libro")
		@data2save = []
		@comments = Comment.where(book_id: n[:book_id])
		@comments.each do |comment|
			@miniar = [:user_id => comment.user.id, :content => n[:content], :book_id => n[:book_id]]
			@data2save.push(@miniar)
		end
		Notification.create(@data2save)
	end


	protected
		def configure_permitted_parameters
		    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password])
		    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :city_id, :photo, :gender, :bithdate, :email, :password, :password_confirmation, :current_password])
		end
  
end