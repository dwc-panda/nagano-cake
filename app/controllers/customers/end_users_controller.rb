class Customers::EndUsersController < ApplicationController
  def index
  end

  def show
  	@end_user = current_end_user
  	@full_name = @end_user.first_name + @end_user.last_name
  	@full_kana_name = @end_user.first_kana_name + @end_user.last_kana_name
  end

  def edit
  	@end_user = current_end_user
  end

  def update
  	end_user = current_end_user
  	end_user.update(end_user_params)
  	redirect_to end_user_path(end_user)
  end

  private
  def end_user_params
  	params.require(:end_user).permit(:first_name, :last_name, :first_kana_name, :last_kana_name, :postcode, :address, :phone_number)
  end
end
