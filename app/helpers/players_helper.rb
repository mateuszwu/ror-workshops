module PlayersHelper
  def player_photo(player)
    photo_url = if player.photo.attached?
                  player.photo
               else
                 'blank-team-logo.png'
               end

    image_tag photo_url, style: 'height: 200px;', class: 'card-img-top img-fluid img-thumbnail'
  end
end
