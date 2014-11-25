var infoPanelOpen = false;
var previousCharacter = null;



//function for the collapsible filter menu
$(function() {
  $( "#filter_panel" ).accordion({
    collapsible: true,
    "heightStyle" : "content"
  });

  $( "#hor_filter" ).selectmenu();

  $( "#vert_filter" ).selectmenu();
});


//function for opening side menu
function openMenu ()
{

  if(!infoPanelOpen){
  infoPanelOpen = true;
  $("#info_panel").animate (
    { 'width' : '20%' }, // The first parameter is a list of CSS attributes that we want to change during the animation.
    "slow" // The next parameter is the duration of the animation.
  );
  $("#character_pane").animate (
    { 'width' : '80%' }, // The first parameter is a list of CSS attributes that we want to change during the animation.
    "slow" // The next parameter is the duration of the animation.
  );
  }
}

//function for opening side menu
function closeMenu ()
{
  if(infoPanelOpen){
    infoPanelOpen = false;
    $("#info_panel").animate (
      { 'width' : '0%' }, // The first parameter is a list of CSS attributes that we want to change during the animation.
      1000 // The next parameter is the duration of the animation.
    );
    $("#character_pane").animate (
      { 'width' : '100%' }, // The first parameter is a list of CSS attributes that we want to change during the animation.
      1000 // The next parameter is the duration of the animation.
    );
  }
}

//function that pulls character info from db
function getCharacterInfo(cid){
  $.get( "ajax/load_character_info.php", {character_id : cid}, function( data ) {
    $( "#info_panel" ).html( data );
    openMenu();
  });
}



//function that highlights and unhighlights character circles
function selectCharacter(circle){
  if(previousCharacter != null && previousCharacter !== circle){
    $(previousCharacter).animate(
      {'background-color' : '#252e60'},
      "fast"
    );
  }
  $(circle).animate(
    {'background-color' : '#339b19'},
    "slow"
  );
}

function unselectAll(){
  if(previousCharacter != null){
    $(previousCharacter).animate(
      {'background-color' : '#252e60'},
      "fast"
    );
  }
  previousCharacter = null;
}





function createCharacterCircles(){
  $.get( "ajax/create_character_circles.php", function( data ) {
    $( "#character_pane" ).html( data );
    bindCircleListeners();
  });
}

function sortCharacters(dir, property){
  var direction = dir;

  var characterCircleArray = [];
  var characterNameArray = [];
  $('.character_circle').each(function(i, obj) {
    characterCircleArray.push(obj);
    characterNameArray.push($(obj).attr(property));
  });

  characterNameArray.sort();

  for(var i = 0; i < characterCircleArray.length; i++){
    var pos = (100/characterCircleArray.length) * characterNameArray.indexOf($(characterCircleArray[i]).attr(property));
    console.log(pos);
    if(direction == 'hor'){
    $(characterCircleArray[i]).animate(
      {'left' : pos+'%'},
      'slow'
    );
  }else if(direction == 'ver'){
    $(characterCircleArray[i]).animate(
      {'top' : pos+'%'},
      'slow'
    );
  }
  }

}

function createCharacterCircles(){
  $.get( "ajax/create_character_circles.php", function( data ) {
    $( "#character_pane" ).html( data );
    bindCircleListeners();
    sortCharacters('ver', $('option:selected',  $('#vert_filter')).attr('val'));
    sortCharacters('hor', $('option:selected', $('#hor_filter')).attr('val'));
  });

}

function sortCharactersNum(dir, property){
  var direction = dir;

  var characterCircleArray = [];
  var characterNameArray = [];
  $('.character_circle').each(function(i, obj) {
    characterCircleArray.push(obj);
    characterNameArray.push($(obj).attr(property));
  });

  characterNameArray.sort(function(a, b){return a-b});

  for(var i = 0; i < characterCircleArray.length; i++){
    var pos = (100/characterCircleArray.length) * characterNameArray.indexOf($(characterCircleArray[i]).attr(property));
    console.log(pos);
    if(direction == 'hor'){
      $(characterCircleArray[i]).animate(
        {'left' : pos+'%'},
        'slow'
      );
    }else if(direction == 'ver'){
      $(characterCircleArray[i]).animate(
        {'top' : pos+'%'},
        'slow'
      );
    }
  }

}






//on ready events bind event listeners
$( document ).ready(function() {
  createCharacterCircles();

$( "#vert_filter" ).on( "selectmenuchange", function( event, ui ) {
  var value = $('option:selected', this).attr('val');
  if(value === "cname"){
    sortCharacters("ver",value);
  }else{
    sortCharactersNum("ver",value);
  }
} );
$( "#hor_filter" ).on( "selectmenuchange", function( event, ui ) {
  var value = $('option:selected', this).attr('val');
  if(value === "cname"){
    sortCharacters("hor",value);
  }else{
    sortCharactersNum("hor",value);
  }
} );
});

function bindCircleListeners(){
  //event listener for character circles
  $(".character_circle").bind ( "click", function ( event ) // We're binding the effect to the click event on any menu_button container.
  {
    getCharacterInfo($(this).attr("cid"));
    selectCharacter(this);
    previousCharacter = this;

    //alert($(this).attr("cid"));
  });
}
