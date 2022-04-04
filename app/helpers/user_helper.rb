module UserHelper
  def view_avatar
    if current_user.user_avatar.attached?
      image_tag current_user.user_avatar
    end
  end
end