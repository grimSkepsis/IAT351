var infoPanelOpen = false;
var previousCharacter = null;

//function for the collapsible filter menu
$(function() {
  $( "#filter_panel" ).accordion({
    collapsible: true
  });
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





//on ready events bind event listeners
$( document ).ready(function() {

//event listener for character circles
$(".character_circle").bind ( "click", function ( event ) // We're binding the effect to the click event on any menu_button container.
{
  getCharacterInfo($(this).attr("cid"));
  selectCharacter(this);
  previousCharacter = this;

  //alert($(this).attr("cid"));
});

//event listener for displaying and hiding the side menu panel
$(".toggle").bind ( "click", function ( event ) // We're binding the effect to the click event on any menu_button container.
{

  closeMenu();
});
});
