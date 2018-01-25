class SeenAnnouncementsController < ApplicationController
  def edit
  end
  
  def update
    @seen_announcement = SeenAnnouncement.find(params[:id]).update_attribute(:seen, true)
    redirect_to announcements_url
     flash[:notice] = "Announcement mark as seen!"
  end 
end
