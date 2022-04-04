module TeamHelper
  def view_logo
    if @team.avatar.attached?
      image_tag @team.avatar
    else
      image_tag 'blank-team-logo.png'
    end
  end
end