module UserHelper
  def view_avatar(current_user)
    if current_user.avatar.attached?
      image_tag current_user.avatar
    end
  end
end