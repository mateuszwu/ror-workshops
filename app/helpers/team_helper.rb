module TeamHelper
  def team_logo(team)
    logo_url = if team.logo.attached?
                 team.logo
               else
                 'blank-team-logo.png'
               end

    image_tag logo_url, alt: "Team #{team.name} logo", style: 'height: 200px;', class: 'card-img-top img-fluid img-thumbnail'
  end
end
