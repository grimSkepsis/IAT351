var infoPanelOpen = false;
var previousCharacter = null;
var compareCharacter = null;
var primedToCompare = false;
var comparing = false;
var selectColor = '#339b19';
var deselectColor = '#2F2F2F';
var compareColor = '#ffc800';
var sortingSimilar = false;
var characterArray = [];
var hiddenInputs = [];
var charModal;
var similarCharacter = null;
function highlightForCompare(){
  $('.character_circle').each(function(i, obj) {
    if(obj !== previousCharacter){
      $(obj).animate(
        {'background-color' : compareColor},
        'slow'
      );
    }
  });
}

function highlightForSimilar(circle){


      $(circle).animate(
        {'background-color' : compareColor},
        'slow'
      );


}

function unHighlightForCompare(){
  $('.character_circle').each(function(i, obj) {
    if(obj !== previousCharacter){
      $(obj).animate(
        {'background-color' : deselectColor},
        'slow'
      );
    }
  });
}

//sorts characters based on their similarity to  a given character, needs weight balancing
function sortSimilar(){

  var attack = $(similarCharacter).attr("attack"),
   guard = $(similarCharacter).attr("guard"),
   speed = $(similarCharacter).attr("speed"),
   utility = $(similarCharacter).attr("utility"),
   playStyle = $(similarCharacter).attr("play_style");

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
    { 'left' : '80%' }, // The first parameter is a list of CSS attributes that we want to change during the animation.
    1000 // The next parameter is the duration of the animation.
  );
  $("#display_pane").animate (
    { 'width' : '80%' }, // The first parameter is a list of CSS attributes that we want to change during the animation.
    1000 // The next parameter is the duration of the animation.
  );
  }
}

//function for opening side menu
function closeMenu (){
  if(infoPanelOpen){
    infoPanelOpen = false;
    $("#info_panel").animate (
      { 'left' : '100%' }, // The first parameter is a list of CSS attributes that we want to change during the animation.
      1000// The next parameter is the duration of the animation.
    );
    $("#display_pane").animate (
      { 'width' : '100%' }, // The first parameter is a list of CSS attributes that we want to change during the animation.
      1000// The next parameter is the duration of the animation.
    );
  }
}

//function that pulls character info from db
function getCharacterInfo(cid){
  $.get( "ajax/load_character_info.php", {character_id : cid}, function( data ) {
    charModal.html( data );
    openCharacterModal();
    //openMenu();
    $("#compare").click(function() {
      if(!primedToCompare){
        primedToCompare = true;
        highlightForCompare();
        charModal.dialog("close");
      }else{
        primedToCompare = false;
        unHighlightForCompare();
      }
    });
    $("#similar").click(function() {
      deselectCharacter(similarCharacter);
      similarCharacter = previousCharacter;
      previousCharacter = null;
      sortSimilar();
      highlightForSimilar(similarCharacter);
      sortingSimilar = true;
      charModal.dialog("close");
      $(".ver_axis_label").html("More to less similar to : " + $(similarCharacter).attr('cname'));
    });
  });
}

//function that pulls character info from db
function getCharacterCompare(cid){
  $.get( "ajax/load_character_comparison.php", {character_id : $(previousCharacter).attr('cid'), compare_id: cid}, function( data ) {
    $( "#dialog" ).html( data );
    //openMenu();
    openCharacterModal();
    $("#exit").click(function() {
      //closeMenu();
      //getCharacterInfo($(previousCharacter).attr('cid'));
      previousCharacter = null;
      comparing = false;
      primedToCompare = false;
      deselectCharacter(compareCharacter);
      compareCharacter = null;
      unHighlightForCompare();
      charModal.dialog("close");

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
  var color;
  if(primedToCompare){
    color = compareColor;
  }else{
    color = deselectColor
  }
    $(circle).animate(
      {'background-color' : color},
      "fast"
    );
}

//unselects all characters
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

//sorts characters based on a textual property
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

//creates the character circles
function createCharacterCircles(){
  $.get( "ajax/create_character_circles.php", function( data ) {
    $( "#character_pane" ).html( data );
    bindCircleListeners();
    sortCharacters('ver', $('option:selected',  $('#vert_filter')).attr('val'));
    sortCharacters('hor', $('option:selected', $('#hor_filter')).attr('val'));
    $( document ).tooltip({ position: { my: "left+5 center", at: "right center" } });
  });

}

//sorts characters based on a numeric property
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

//updates which characters are shown and which are hidden
function updateHiddenCharacters(){
  var hiddenCharacters = [];
  var shownCharacters = [];
  $('.character_circle').each(function(i, obj) {
      shownCharacters.push(obj);
      for(var j =0; j< hiddenInputs.length; j++){
        var numInputs = $(obj).attr(hiddenInputs[j]);

        if(numInputs > 0){
          shownCharacters.splice(shownCharacters.indexOf(obj), 1);
          hiddenCharacters.push(obj);
          break;
        }
      }
  });
  for(var k = 0; k < shownCharacters.length; k++){
    $(shownCharacters[k]).show(400);
  }
  for(var k = 0; k < hiddenCharacters.length; k++){
    $(hiddenCharacters[k]).hide(400);
  }
}

////////////////////////////////////////////////////////////////////////////////
//INITIALIZATION STUFFS ////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

//on ready events bind event listeners
$( document ).ready(function() {
  createCharacterCircles();
  $( ".ver_axis_label" ).css( "left", "20%" );
  $( ".ver_axis_label" ).css( "left", "0%" );
$( "#vert_filter" ).on( "selectmenuchange", function( event, ui ) {
  var value = $('option:selected', this).attr('val');
  deselectCharacter(similarCharacter);
  similarCharacter = null;
  var axis = $('option:selected', this).attr('axis');
  $(".ver_axis_label").html(axis);
  $( ".ver_axis_label" ).css( "left", "0%" );

  if(value === "cname"){
    sortCharacters("ver",value);
  }else{
    sortCharactersNum("ver",value);
  }
} );

$( "#hor_filter" ).on( "selectmenuchange", function( event, ui ) {
  var value = $('option:selected', this).attr('val');
  var axis = $('option:selected', this).attr('axis');
  $(".hor_axis_label").html(axis);

  if(value === "cname"){
    sortCharacters("hor",value);
  }else{
    sortCharactersNum("hor",value);
  }
} );

$(".input_box").change(function() {
  if(this.checked) {
    var val = $(this).attr('val');
    hiddenInputs.push(val);
    //hideCharacters(val);
    updateHiddenCharacters();
  }else{
    var val = $(this).attr('val');
    var index = hiddenInputs.indexOf(val);
    hiddenInputs.splice(index, 1);
    //showCharacters(val);
    updateHiddenCharacters();
  }
});
$('#dialog').on( "dialogclose", function( event, ui ) {
  if(!primedToCompare && !sortingSimilar){
    deselectCharacter(previousCharacter);
    previousCharacter = null;
  }
});
});



function bindCircleListeners(){
  //event listener for character circles
  $(".character_circle").bind ( "click", function ( event )
  {
    if(!primedToCompare){
      if(previousCharacter !== this){
        getCharacterInfo($(this).attr("cid"));
        selectCharacter(this);
        deselectCharacter(previousCharacter);
        previousCharacter = this;

      }else{
        deselectCharacter(this);
        previousCharacter = null;
        closeMenu();
      }
    }
    else if (this !== previousCharacter){
      if(!comparing){
        comparing = true;
        closeMenu();
      }
      deselectCharacter(compareCharacter);
      selectCharacter(this);
      compareCharacter = this;
      getCharacterCompare($(this).attr('cid'));

    }
  });
}

function openCharacterModal(){
  charModal.dialog("open");
}

//function for the collapsible filter menu
$(function() {
  $( "#filter_panel" ).accordion({
    collapsible: true,
    "heightStyle" : "content"
  });

  $( "#hor_filter" ).selectmenu();

  $( "#vert_filter" ).selectmenu();


  $( "#input_filters_basic" ).buttonset();
  $( "#input_filters_intermediate" ).buttonset();
  charModal = $( "#dialog" ).dialog({
    autoOpen: false,
    modal: true,
    width: 800,
    height: 600
  });

});
