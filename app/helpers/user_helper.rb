module UserHelper
  def user_avatar(user)
    avatar_url = if user.avatar.attached?
                   user.avatar
                 else
                   'blank-user-avatar.jpeg'
                 end

    image_tag avatar_url, alt: "user #{user.email} avatar", class: 'card-img-top'
  end

  def user_text(user)
    if user.full_name.present?
      user.full_name
    else
      user.email
    end
  end

  def user_link(user)
    link_to user_text(user), current_user, class: 'nav-link'
  end
end
