<?php
  $backend_enabled = true;
  if($backend_enabled){
    //do the individual queries for each tab
  //stats
  $db = new mysqli("localhost","fight_game_user","pass","character_db");
  //$query = "select * FROM character_registry  WHERE id in (".$_GET['character_id'].",".$_GET['compare_id'].")";
  $query = "SELECT character_registry.id, character_stats.attack, character_stats.health, character_stats.guard_gauge,
  character_stats.speed, character_stats.utility, character_stats.difficulty,
  character_stats.tier_rank,
  character_registry.character_name, character_lore.body, character_lore.header, character_lore.quote
  FROM character_registry, character_lore, character_stats
  WHERE character_registry.id in (?,?) AND character_lore.character_id = character_registry.id
  AND character_stats.character_id = character_registry.id";

  $stmt = $db->prepare($query);

  $cid = $_GET['character_id'] ;
  $compId = $_GET['compare_id'];

  $stmt->bind_param('ii', $cid, $compId);
  $stmt->execute();

  $results = $stmt->get_result();
  $infoA = $results->fetch_array(MYSQLI_ASSOC);
  $infoB = $results->fetch_array(MYSQLI_ASSOC);

  $charInfo;
  $compInfo;
  if($infoA['id'] === $_GET['character_id']){
    $charInfo = $infoA;
    $compInfo = $infoB;
  }else{
    $charInfo = $infoB;
    $compInfo = $infoA;
  }

  $charStatString = '
  <h3>Character Stats</h3>
  <p>Health: '.$charInfo['health'].'</p>
  <p>Attack: '.$charInfo['attack'].'</p>
  <p>Speed: '.$charInfo['speed'].'</p>
  <p>Utility: '.$charInfo['utility'].'</p>
  <p>Guard Gauge: '.$charInfo['guard_gauge'].'</p>
  <h3>Misc. Stats</h3>
  <p>Difficulty: '.$charInfo['difficulty'].'</p>
  <p>Tier Ranking: '.$charInfo['tier_rank'].'</p>
';

  $compStatString = '
  <h3>Character Stats</h3>
  <p>Health: '.$compInfo['health'].'</p>
  <p>Attack: '.$compInfo['attack'].'</p>
  <p>Speed: '.$compInfo['speed'].'</p>
  <p>Utility: '.$compInfo['utility'].'</p>
  <p>Guard Gauge: '.$compInfo['guard_gauge'].'</p>
  <h3>Misc. Stats</h3>
  <p>Difficulty: '.$compInfo['difficulty'].'</p>
  <p>Tier Ranking: '.$compInfo['tier_rank'].'</p>
  ';

  //lore
  $charLoreString = '
  <h3>'.$charInfo['header'].'</h3>
  <h4>'.$charInfo['quote'].'</h4>
  <p>'.$charInfo['body'].'</p>';

  $compLoreString = '
  <h3>'.$compInfo['header'].'</h3>
  <h4>'.$compInfo['quote'].'</h4>
  <p>'.$compInfo['body'].'</p>';

  $results->free();
  //moves
  $moveQuery = " SELECT *
  FROM character_moves
  WHERE character_id = ?
  LIMIT 0 , 30";
  $charMoveStmt = $db->prepare($moveQuery);
  $charMoveStmt->bind_param('i',$cid);
  $charMoveStmt->execute();
  $charMoveResults = $charMoveStmt->get_result();
  $charMoveString ='';
  while($row = $charMoveResults->fetch_array(MYSQLI_ASSOC)){
    $charMoveString.='<div><h2>'.$row['name'].'</h2>
    <img src = '.$row['img'].'>
    <p>Damage: '.$row['damage'].'</p>
    <p>Description:</p><p>'.$row['description'].'</p>
    <p style = "color:green;">Pros:</p><p style = "color:green;">'.$row['pros'].'</p>
    <p style = "color:red;">Cons:</p><p style = "color:red;">'.$row['cons'].'</p>
    </div><br>';
  }
  $charMoveResults->free();

  $compMoveStmt = $db->prepare($moveQuery);
  $compMoveStmt->bind_param('i',$compId);
  $compMoveStmt->execute();
  $compMoveResults = $compMoveStmt->get_result();
  $compMoveString ='';
  while($row = $compMoveResults->fetch_array(MYSQLI_ASSOC)){
    $compMoveString.='<div><h2>'.$row['name'].'</h2>
    <img src = '.$row['img'].'>
    <p>Damage: '.$row['damage'].'</p>
    <p>Description:</p><p>'.$row['description'].'</p>
    <p style = "color:green;">Pros:</p><p style = "color:green;">'.$row['pros'].'</p>
    <p style = "color:red;">Cons:</p><p style = "color:red;">'.$row['cons'].'</p>
    </div><br>';
  }
  $compMoveResults->free();
  //combos
  $comboQuery = " SELECT *
  FROM character_combos
  WHERE character_id = ?
  LIMIT 0 , 30";

  $charComboStmt = $db->prepare($comboQuery);
  $charComboStmt->bind_param('i',$cid);
  $charComboStmt->execute();
  $charComboResults = $charComboStmt->get_result();
  $charComboString ='';
  while($row = $charComboResults->fetch_array(MYSQLI_ASSOC)){
    $charComboString.='<div><h2>'.$row['title'].'</h2>
    <img src = '.$row['inputs'].'>
    <p>Damage: '.$row['damage'].'</p>
    <p>Description:</p><p>'.$row['description'].'</p>
    <p style = "color:green;">Pros:</p><p style = "color:green;">'.$row['pros'].'</p>
    <p style = "color:red;">Cons:</p><p style = "color:red;">'.$row['cons'].'</p>
    </div><br>';
  }
  $charComboResults->free();

  $compComboStmt = $db->prepare($comboQuery);
  $compComboStmt->bind_param('i',$compId);
  $compComboStmt->execute();
  $compComboResults = $compComboStmt->get_result();
  $compComboString ='';
  while($row = $compComboResults->fetch_array(MYSQLI_ASSOC)){
    $compComboString.='<div><h2>'.$row['title'].'</h2>
    <img src = '.$row['inputs'].'>
    <p>Damage: '.$row['damage'].'</p>
    <p>Description:</p><p>'.$row['description'].'</p>
    <p style = "color:green;">Pros:</p><p style = "color:green;">'.$row['pros'].'</p>
    <p style = "color:red;">Cons:</p><p style = "color:red;">'.$row['cons'].'</p>
    </div><br>';
  }
  $compComboResults->free();

  $db->close();
  echo("<h3>".stripslashes($charInfo['character_name'])."</h3>");

}else{
  echo("<h3>Character Name</h3>");
}

?>

<div class="tabs">
  <ul>
    <li><a href="#tabs-1">Moves</a></li>
    <li><a href="#tabs-2">Combos</a></li>
    <li><a href="#tabs-3">Stats</a></li>
    <li><a href="#tabs-4">Lore</a></li>
  </ul>
  <div class = "content_tab_compare"  id="tabs-1">
    <?php
      echo $charMoveString;
    ?>
  </div>
  <div class = "content_tab_compare" id="tabs-2">
    <?php
      echo $charComboString;
    ?>
  </div>
  <div class = "content_tab_compare" id="tabs-3">
    <?php
    echo $charStatString;
    ?>
  </div>
  <div class = "content_tab_compare" id="tabs-4">
    <?php
    echo $charLoreString;
    ?>
  </div>
</div>



<?php
  echo("<h3>".stripslashes($compInfo['character_name'])."</h3>");
?>
<div class="tabs">
  <ul>
    <li><a href="#tabs-1">Moves</a></li>
    <li><a href="#tabs-2">Combos</a></li>
    <li><a href="#tabs-3">Stats</a></li>
    <li><a href="#tabs-4">Lore</a></li>
  </ul>
  <div class = "content_tab_compare" id="tabs-1">
    <?php
      echo $compMoveString;
    ?>
  </div>
  <div class = "content_tab_compare" id="tabs-2">
    <?php
      echo $compComboString;
    ?>
  </div>
  <div class = "content_tab_compare" id="tabs-3">
    <?php
      echo $compStatString;
    ?>
  </div>
  <div class = "content_tab_compare" id="tabs-4">
    <?php
      echo $compLoreString;
    ?>
  </div>
</div>

<center>
  <button id="exit">Stop Comparing</button>
</center>

<script>
  $(function() {
    $( ".tabs" ).tabs();
  });

</script>
