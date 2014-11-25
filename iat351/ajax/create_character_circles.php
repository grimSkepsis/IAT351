<?php
  $db = new mysqli("localhost","fight_game_user","pass","character_db");
  $query = "SELECT *
  FROM character_registry, character_stats
  WHERE character_registry.id = character_stats.character_id";
  $results = $db->query($query);
while($info = $results->fetch_assoc()){
    echo '<div class = "character_circle" cid = "'.$info['character_id'].'"
                                          cname = "'.$info['character_name'].'"
                                          tier = "'.$info['tier_rank'].'"
                                          difficulty = "'.$info['difficulty'].'"><img src = "img/'.$info['picture_url'].'"></div>';
}
  $results->free();
  $db->close();
?>
