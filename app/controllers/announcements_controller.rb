class AnnouncementsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy, :index, :edit, :update]
  
  def index
    @announcements = []
    if cookies[:seen_announcements].nil?
      @announcements = Announcement.all
    else
      @announcements = Announcement.where.not(id: cookies.signed[:seen_announcements])
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
  
  def mark_as_seen
    seen_announcements = cookies.signed[:seen_announcements] || []
    seen_announcements = seen_announcements << params[:announcement]
    
    cookies.signed[:seen_announcements] = seen_announcements
    flash[:notice] = 'Marcado como visto'
    redirect_to announcements_url
  end

  private

    def announcement_params
      params.require(:announcement).permit(:content, :expiration_date)
    end
end
