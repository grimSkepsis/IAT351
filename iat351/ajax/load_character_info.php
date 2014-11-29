<?php
  $backend_enabled = true;
  if($backend_enabled){
  $db = new mysqli("localhost","fight_game_user","pass","character_db");
  $query = "SELECT character_stats.attack, character_stats.health, character_stats.guard_gauge,
              character_stats.speed, character_stats.utility, character_stats.difficulty,
              character_stats.tier_rank,
              character_registry.character_name, character_lore.body, character_lore.header, character_lore.quote
              FROM character_registry, character_lore, character_stats
              WHERE character_registry.id = ? AND character_lore.character_id = character_registry.id
              AND character_stats.character_id = character_registry.id";

  $stmt = $db->prepare($query);
  $cid = $_GET['character_id'] ;

            /* Bind parameters. Types: s = string, i = integer, d = double,  b = blob */
  $stmt->bind_param('i', $cid);
  $stmt->execute();

  $results = $stmt->get_result();
  $info = $results->fetch_array(MYSQLI_ASSOC);

  $moveQuery = " SELECT *
  FROM character_moves
  WHERE character_id = ?
  LIMIT 0 , 30";

  $moveStmt = $db->prepare($moveQuery);
  $moveStmt->bind_param('i',$cid);
  $moveStmt->execute();
  $moveResults = $moveStmt->get_result();

  $moveTabString ='';
  while($row = $moveResults->fetch_array(MYSQLI_ASSOC)){
    $moveTabString.='<div><h2>'.$row['name'].'</h2>
                    <img src = '.$row['img'].'>
                    <p>Damage: '.$row['damage'].'</p>
                    <p>Description:</p><p>'.$row['description'].'</p>
                    <p style = "color:green;">Pros:</p><p style = "color:green;">'.$row['pros'].'</p>
                    <p style = "color:red;">Cons:</p><p style = "color:red;">'.$row['cons'].'</p>
                    </div><br>';
  }

  echo("<h1>".stripslashes($info['character_name'])."</h1>");
  $results->free();
  $db->close();
}else{
  echo("<h1>Character Name</h1>");
}

?>
<?php
echo '<div class="tabs" style = "height:70%">
  <ul>
    <li><a href="#tabs-1">Moves</a></li>
    <li><a href="#tabs-2">Combos</a></li>
    <li><a href="#tabs-3">Stats</a></li>
    <li><a href="#tabs-4">Lore</a></li>
  </ul>
  <div id="tabs-1" class = "content_tab">'.$moveTabString.'
  </div>
  <div id="tabs-2">
  </div>
  <div class = "content_tab" id="tabs-3">
  <h3>Character Stats</h3>
  <p>Health: '.$info['health'].'</p>
  <p>Attack: '.$info['attack'].'</p>
  <p>Speed: '.$info['speed'].'</p>
  <p>Utility: '.$info['utility'].'</p>
  <p>Guard Gauge: '.$info['guard_gauge'].'</p>
  <h3>Misc. Stats</h3>
  <p>Difficulty: '.$info['difficulty'].'</p>
  <p>Tier Ranking: '.$info['tier_rank'].'</p>
  </div>
  <div class = "content_tab" id="tabs-4">

      <h3>'.$info['header'].'</h3>
      <h4>'.$info['quote'].'</h4>
      <p>'.$info['body'].'</p>

  </div>
</div>
<center>
  <button id="similar">Similar</button>
  <button id="compare">Compare</button>
</center>';

?>
<script>
  $(function() {
    $( ".tabs" ).tabs();
  });

</script>
