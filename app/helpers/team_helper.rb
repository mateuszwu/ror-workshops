module TeamHelper
  def view_logo(team)
    if team.logo.attached?
      image_tag team.logo
    else
      image_tag 'blank-team-logo.png'
    end
  end
end