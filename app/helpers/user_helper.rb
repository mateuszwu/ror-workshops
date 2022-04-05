module UserHelper
  def view_avatar(current_user)
    if current_user.avatar.attached?
      image_tag current_user.avatar
    end
  end

  def full_name(current_user)
    if current_user.first_name.present? or current_user.last_name.present?
      current_user.first_name + " " + current_user.last_name
    else
      current_user.email
    end
  end
end