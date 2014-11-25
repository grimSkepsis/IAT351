<?php
  $backend_enabled = true;
  if($backend_enabled){
  $cid = 1;
  $db = new mysqli("localhost","fight_game_user","pass","character_db");
  $query = "select * from character_registry where id = '".$_GET['character_id']."'";
  $results = $db->query($query);
  $info = $results->fetch_assoc();
  echo("<h1>".stripslashes($info['character_name'])."</h1>");
  $results->free();
  $db->close();
}else{
  echo("<h1>Character Name</h1>");
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
<center>
  <button id="similar">Similar</button>
  <button id="compare">Compare</button>
</center>
<script>
  $(function() {
    $( ".tabs" ).tabs();
  });

</script>
