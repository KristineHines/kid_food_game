$(document).ready(function(){
	$("input#category_button").on("click", function(event){
		event.preventDefault()
		$("div#category_1").removeClass("active").addClass("inactive");
		$("div#category_1").next().removeClass("inactive").addClass("active");
	});
});