module AnnouncementsHelper
  def full_name(id)
    user = User.find(id)
    return "#{user.name} #{user.last_name}"
  end
end
