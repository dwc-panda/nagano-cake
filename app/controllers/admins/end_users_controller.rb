class Admins::EndUsersController < ApplicationController

def index
  # @end_user = EndUser.find(params[:id])
  @end_users = EndUser.all
end

def show
   @end_user = current_end_user
  # @end_user = EndUser.find(params[:id])
end

def edit
  @end_user = EndUser.find(params[:id])

end

def update
  @end_user = EndUser.find(params[:id])
  if @end_user.update(end_user_params)
  redirect_to admins_end_user_path(@end_user)
  else
	redirect_back(fallback_location: root_path)
  end
end
private

def end_user_params
	params.require(:end_user).permit(:first_name, :last_name, :first_kana_name, :last_kana_name, :postcode, :address, :phone_number, :email)
end
end
