<?php
  $backend_enabled = true;
  if($backend_enabled){

  $db = new mysqli("localhost","fight_game_user","pass","character_db");
  $query = "select * FROM character_registry  WHERE id in (".$_GET['character_id'].",".$_GET['compare_id'].")";

  $results = $db->query($query);
  $infoA = $results->fetch_assoc();
  $infoB = $results->fetch_assoc();
  $charInfo;
  $compareInfo;
  if($infoA['id'] === $_GET['character_id']){
    $charInfo = $infoA;
    $compareInfo = $infoB;
  }else{
    $charInfo = $infoB;
    $compareInfo = $infoA;
  }

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
  <div id="tabs-1">
  </div>
  <div id="tabs-2">
  </div>
  <div id="tabs-3">
  </div>
  <div id="tabs-4">
  </div>
</div>
<?php

  echo("<h3>".stripslashes($compareInfo['character_name'])."</h3>");
  $results->free();
  $db->close();
?>
<div class="tabs">
  <ul>
    <li><a href="#tabs-1">Moves</a></li>
    <li><a href="#tabs-2">Combos</a></li>
    <li><a href="#tabs-3">Stats</a></li>
    <li><a href="#tabs-4">Lore</a></li>
  </ul>
  <div id="tabs-1">
  </div>
  <div id="tabs-2">
  </div>
  <div id="tabs-3">
  </div>
  <div id="tabs-4">
  </div>
</div>

<center>
  <button id="exit">Exit</button>

</center>
<script>
  $(function() {
    $( ".tabs" ).tabs();
  });

</script>
