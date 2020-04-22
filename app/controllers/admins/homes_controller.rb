class Admins::HomesController < ApplicationController
	before_action :authenticate_admins_user!
	def top
	end
end
