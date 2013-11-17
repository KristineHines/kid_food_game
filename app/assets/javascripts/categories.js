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
		$.ajax({
			type: 'POST',
			url: '/api/score_recipe',
			data: {title : "basket", ingredients : basket},
			dataType: "json" 
		}).success(function(data){
			$('.results_button').addClass("results_inactive");
			$("#category_3").removeClass("active").addClass("inactive");
			$('#final_recipe').removeClass("inactive");
			$("#calories").text(data['calories']);
		});
		$.ajax({
			type: 'POST',
			url: '/foods/calculate_score',
			data: {ingredients : basket},
			dataType: "json" 
		}).success(function(data){
			console.log(data['average']);
			var good_basket = data['good_basket']
				for (var i=0; i<good_basket.length; i++){
					$(".balance-left").append("<img class='img_resize' src='/assets/" + good_basket[i]['image'] + ".png' >");
				}
			var score = data['average'];
			if (score >= 4){
				$("#healthiness-div").addClass('bg-ok');
				$("#healthiness-image").attr('src', '/assets/thumbsup.png');
				$("#balance").attr('src', '/assets/seasaw-1.png');
				$("#left-loc").addClass('balance-left-loc-ok');
				$("#right-loc").addClass('balance-right-loc-ok');
			} else if (score < 4 && score >= 2.5){
				$("#healthiness-div").addClass('bg-mid');
				$("#healthiness-image").attr('src', '/assets/thumbsmid.png');
				$("#balance").attr('src', '/assets/seasaw-2.png');
				$("#left-loc").addClass('balance-left-loc-mid');
				$("#right-loc").addClass('balance-right-loc-mid');
			} else {
				$("#healthiness-div").addClass('bg-ko');
				$("#healthiness-image").attr('src', '/assets/thumbsdown.png');
				$("#balance").attr('src', '/assets/seasaw-3.png');
				$("#left-loc").addClass('balance-left-loc-ko');
				$("#right-loc").addClass('balance-right-loc-ko');
			}
			var bad_basket = data['bad_basket']
				for (var i=0; i<bad_basket.length; i++){
					$(".balance-right").append("<img class='img_resize' src='/assets/" + bad_basket[i]['image'] + ".png' >");
				}
		});
	});
});


