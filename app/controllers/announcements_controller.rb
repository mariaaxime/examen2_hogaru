class AnnouncementsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  
  def create
    @announcement = current_user.announcements.build(announcement_params)
    if @announcement.save
      flash[:notice] = "Announcement created!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def destroy
  end

  private

    def announcement_params
      params.require(:announcement).permit(:content, :expiration_date)
    end
end
