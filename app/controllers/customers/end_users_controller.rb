class Customers::EndUsersController < ApplicationController
  before_action :authenticate_end_user!
  def index
  end

  def show
  	@end_user = current_end_user
  end

  def edit
  	@end_user = current_end_user
  end

  def update
  	@end_user = current_end_user
  	if @end_user.update(end_user_params)
  	   redirect_to end_user_path(@end_user), notice: "会員情報が更新されました。"
    else
      render :edit
    end
  end

  def confirm
    @end_user = current_end_user
  end
  # 退会するためのアクション
  def withdrawal
    end_user = current_end_user
      end_user.is_deleted == false
      end_user.update(is_deleted: true)
      redirect_to root_path
      #sessionはユーザーの情報を持っているので、強制的にresetで消している。
      reset_session
  end

  private
  def end_user_params
  	params.require(:end_user).permit(:is_delete, :first_name, :last_name, :first_kana_name, :last_kana_name, :postcode, :address, :phone_number, :email)
  end
end
