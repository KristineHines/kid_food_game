$(document).ready(function(){
	$("#category_button").on("click", function(event){
		event.preventDefault()
		var active = $(".active");
		var last = $('#category_2');
		active.removeClass("active").addClass("inactive");
		active.next().removeClass("inactive").addClass("active");
	});

	$(".food_item").on("click", function(){
		console.log(this.id);
	});
});

