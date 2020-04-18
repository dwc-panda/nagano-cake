class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters,if: :devise_controller?


	protected
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :first_kana_name, :last_kana_name, :email, :postcode, :address, :phone_number])
	end

	def after_sign_in_path_for(resource_or_scope)
		if resource_or_scope == :user
			'/'
		else resource_or_scope == :end_user
			items_path
		end
	end
end
