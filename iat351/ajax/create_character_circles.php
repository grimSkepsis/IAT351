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
                                          difficulty = "'.$info['difficulty'].'"
                                          play_style = "'.$info['play_style'].'"
                                          attack = "'.$info['attack'].'"
                                          speed = "'.$info['speed'].'"
                                          health = "'.$info['health'].'"
                                          guard = "'.$info['guard_gauge'].'"
                                          utility = "'.$info['utility'].'"

                                          half_circles = "'.$info['num_half_circle'].'"
                                          double_half_circles = "'.$info['num_double_half_circle'].'"
                                          quarter_circles = "'.$info['num_quarter_circle'].'"
                                          double_quarter_circles = "'.$info['num_double_quarter_circle'].'"
                                          dragon_punches = "'.$info['num_dp'].'"
                                          three_sixties = "'.$info['num_360'].'"
                                          double_three_sixties = "'.$info['num_double_360'].'"
                                          pretzel = "'.$info['num_pretzel'].'"
                                          quarter_half_circles = "'.$info['num_quarter_half_circle'].'"
                                          half_quarter_circles = "'.$info['num_half_quarter_circle'].'"
                                          back_charges = "'.$info['num_back_charge'].'"
                                          down_charges = "'.$info['num_down_charge'].'"

                                          ><img src = "img/'.$info['picture_url'].'"></div>';
}
  $results->free();
  $db->close();
?>
