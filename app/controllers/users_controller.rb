class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @announcement = current_user.announcements.build if user_signed_in?
  end
end
