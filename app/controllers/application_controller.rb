class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception

	before_filter :configure_permitted_parameters, if: :devise_controller?

	before_action :set_locale

	#solo administrador
	WillPaginate.per_page = 24

 
	def set_locale
	  I18n.locale = params[:locale] || I18n.default_locale
	end

	def default_url_options
	  { locale: I18n.locale }
	end


	protected
		def configure_permitted_parameters
		    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password])
		end

	#solo administrador
	private
		def is_admin
			if !user_signed_in? || current_user.rol != "Admin"
				flash[:error] = "unauthorized access"
				redirect_to new_user_session_path
			end
		end

	
	
end