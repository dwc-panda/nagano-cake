class Admins::EndUsersController < ApplicationController

def index
  @end_users = EndUser.all
end

def show
  @end_user = EndUser.find(params[:id])

end

def edit
  @end_user = EndUser.find(params[:id])

end

def update
  @end_user = EndUser.find(params[:id])
  @end_user.update
  redirect_to @end_user
end
end
