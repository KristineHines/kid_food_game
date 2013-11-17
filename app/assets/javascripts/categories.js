$(document).ready(function(){
	var click_count = 0
	$("#category_button").on("click", function(event){
		event.preventDefault()
		var active = $(".active");
		click_count = click_count + 1
		active.removeClass("active").addClass("inactive");
		active.next().removeClass("inactive").addClass("active");
		if (click_count == 2){
			$("#category_button").remove();
			$(".results_button").removeClass("results_inactive");
		}
	});

	var basket = []
	$(".food_item").on("click", function(){
		basket.push(this.id);
		$("#basket").text(basket.length);
		$(this).addClass("inactive");
	});

	$('.results_button').on('click', function(event) {
		event.preventDefault();
		alert("hello");
		$.ajax({
			type: 'POST',
			url: '/api/score_recipe',
			data: {title : "basket", ingredients : basket},
			dataType: "json" 
		}).success(function(data){
			alert(data);
		});
	});
});


