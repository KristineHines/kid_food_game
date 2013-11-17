
$(document).ready(function(){
	$('.food-group').draggable( {
		containment: '.bg',
		stack: '.drag-area div',
		cursor: 'move',
		revert: true
	} );

	$('.drag-area').droppable( {
		hoverClass: 'hovered', 
    drop: handleCardDrop
	} );
})
var correctCards = 0;

function handleCardDrop( event, ui ) {
  var food = $(this).attr('id');
  var id = ui.draggable.attr('id');
  // If the card was dropped to the correct slot,
  // change the card colour, position it directly
  // on top of the slot, and prevent it being dragged
  // again
 
  if ( food == id ) {
    ui.draggable.addClass( 'correct' );
    ui.draggable.draggable( 'disable' );
    $(this).droppable().css("border", "none"); 
    $(this).droppable( 'disable' );
    ui.draggable.position( { of: $(this), my: 'left top', at: 'left top' } );
    ui.draggable.draggable( 'option', 'revert', false );
    correctCards++;
  } 
   
  // If all the cards have been placed correctly then display a message
  // and reset the cards for another go
 
  if ( correctCards == 5 ) {
    $('#successMessage').show();
    
  }
 
}