module UserHelper
  def user_avatar(user)
    avatar_url = if user.avatar.attached?
                   user.avatar
                 else
                   'blank-user-avatar.jpeg'
                 end

    image_tag avatar_url, alt: "user #{user.email} avatar", class: 'card-img-top'
  end

  def user_link(user)
    link_text = if user.full_name.present?
                  user.full_name
                else
                  user.email
                end
    link_to link_text, current_user, class: 'nav-link'
  end
end
