var infoPanelOpen = false;
var previousCharacter = null;
var compareCharacter = null;
var primedToCompare = false;
var comparing = false;
var selectColor = '#339b19';
var deselectColor = '#2F2F2F';
var characterArray = [];



function sortSimilar(){

  var attack = $(previousCharacter).attr("attack"),
   guard = $(previousCharacter).attr("guard"),
   speed = $(previousCharacter).attr("speed"),
   utility = $(previousCharacter).attr("utility"),
   playStyle = $(previousCharacter).attr("play_style");

   var characterArray= [],
   sortArray = [];

  $('.character_circle').each(function(i, obj) {
    characterArray.push(obj);
    var sCon = 1,
    tempAttack = $(obj).attr("attack"),
    tempGuard = $(obj).attr("guard"),
    tempSpeed  = $(obj).attr("speed"),
    tempUtility = $(obj).attr("utility"),
    tempPlaystyle = $(obj).attr("play_style"),
    tempName = $(obj).attr("cname")
    ;
    //( | (V1 - V2) | / ((V1 + V2)/2) ) * 100
    sCon -= 0.15 * (Math.abs(attack - tempAttack)/((attack+tempAttack)/2));
    sCon -= 0.15 * (Math.abs(guard - tempGuard)/((guard+tempGuard)/2));
    sCon -= 0.15 * (Math.abs(speed - tempSpeed)/((speed+tempSpeed)/2));
    sCon -= 0.15 * (Math.abs(utility - tempUtility)/((utility+tempUtility)/2));
    if(playStyle !== tempPlaystyle){
      sCon -= 0.4;
    }
    sortArray.push(sCon);
  });
  console.log(characterArray);

  for(var i = 0; i < characterArray.length; i++){
    var pos = 100 - (100 * sortArray[i]);
    $(characterArray[i]).animate(
      {'top' : pos+'%'},
      'slow'
    );
  }
}

//function for opening side menu
function openMenu (){

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
function closeMenu (){
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
    $("#compare").click(function() {
      primedToCompare = true;
    });
    $("#similar").click(function() {
      sortSimilar();
    });
  });
}

//function that pulls character info from db
function getCharacterCompare(cid){
  $.get( "ajax/load_character_comparison.php", {character_id : $(previousCharacter).attr('cid'), compare_id: cid}, function( data ) {
    $( "#info_panel" ).html( data );
    openMenu();
    $("#exit").click(function() {
      closeMenu();
      getCharacterInfo($(previousCharacter).attr('cid'));
      comparing = false;
      primedToCompare = false;
      deselectCharacter(compareCharacter);
      compareCharacter = null;
    });
  });
}


//function that highlights character circles
function selectCharacter(circle){
  $(circle).animate(
    {'background-color' : selectColor},
    "slow"
  );
}

//function that unhighlights character circles
function deselectCharacter(circle){
    $(circle).animate(
      {'background-color' : deselectColor},
      "fast"
    );
}

function deselectAll(){
  if(previousCharacter != null){
    $(previousCharacter).animate(
      {'background-color' : '#252e60'},
      "fast"
    );
  }
  previousCharacter = null;
  compareCharacter = null;
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
    var pos = (100/characterCircleArray.length) *
    characterNameArray.indexOf($(characterCircleArray[i]).attr(property));
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


////////////////////////////////////////////////////////////////////////////////
//INITIALIZATION STUFFS ////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

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
  $(".character_circle").bind ( "click", function ( event )
  {
    if(!primedToCompare){
      getCharacterInfo($(this).attr("cid"));
      selectCharacter(this);
      deselectCharacter(previousCharacter);
      previousCharacter = this;
    }
    else{
      if(!comparing){
        comparing = true;
        closeMenu();
      }
      deselectCharacter(compareCharacter);
      selectCharacter(this);
      compareCharacter = this;
      getCharacterCompare($(this).attr('cid'));
    }
    //alert($(this).attr("cid"));
  });
}

//function for the collapsible filter menu
$(function() {
  $( "#filter_panel" ).accordion({
    collapsible: true,
    "heightStyle" : "content"
  });

  $( "#hor_filter" ).selectmenu();

  $( "#vert_filter" ).selectmenu();
});
