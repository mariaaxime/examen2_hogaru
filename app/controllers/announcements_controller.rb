class AnnouncementsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy, :index, :edit, :update]
  
  def index
    @announcements = []
    Announcement.all.map do |a|
      @announcements.push(a) if !SeenAnnouncement.find_by(announcement_id: a.id, user_id: current_user.id).seen && a.expiration_date >= Date.today
    end
  end
  
  def create
    @announcement = current_user.announcements.build(announcement_params)
    if @announcement.save
      User.all.each do |u|
        seen_announcement = SeenAnnouncement.new(user_id: u.id, announcement_id: @announcement.id, seen: false)
        seen_announcement.save
      end
      flash[:notice] = "Announcement created!"
      redirect_to announcements_url
    else
      redirect_to announcements_url
      flash[:alert] = "Announcement couldn't be created."
    end
  end

  def destroy
  end

  private

    def announcement_params
      params.require(:announcement).permit(:content, :expiration_date)
    end
end
