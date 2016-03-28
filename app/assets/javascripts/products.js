$(document).ready(function() {
	createCategorySelectorBox();
	addItemToCartSelector();
	createAddProductListener();
	createRemoveProductListener();
});


var createAddProductListener = function() {
	$('.add-quantity').on('submit', function(e){
		e.preventDefault();
		var url = $(this).attr('action')
		$.ajax({
			url: url,
			method: 'POST', 
			data: $(this).serialize()
		}).done(function(response){
			$('input#10')
			var orderProductId = $('input#' + response.id)
			orderProductId.val(response.quantity)
		})
	})
}

var createRemoveProductListener = function(){
	$('.remove-quantity').on('submit', function(e){
		e.preventDefault();
		var url=$(this).attr('action')
		$.ajax({
			url: url, 
			method: 'POST', 
			data: $(this).serialize()
		}).done(function(response){
			var orderProductId = $('input#' + response.id)
			orderProductId.val(response.quantity)
		})
	})
}


var addItemToCartSelector = function() {
	$('.add-to-cart').on('submit', function(e){
		e.preventDefault()
		console.log(e)
		 var url = $(this).attr('action')
		 var data = $(this).serialize()
		$.ajax({
			url: url, 
			method: 'PUT', 
			data: data
		}).done(function(response){
			$('#myModal').html(response)  
			$('#myModal').modal({show: true, backdrop: false})  
		})
	})
}


var createCategorySelectorBox = function() {
	$('.categories').select2({
  		maximumSelectionLength: 4,
	  	ajax: {
	  		url: "/categories/search",
	  		dataType: 'json',
	  		delay: 250,
	  		data: function(params){
	  			return {
	  				q: params.term,
	  				page: params.page
	  			};
	  		},
	  		processResults: function(data, params) {
	  			params.page = params.page || 1;
	  			data
	  			return {
	  				results: data.map(function(category){ 
	  					return {id: category.id, text: category.name}
	  				})
	  			}
	  		}
	  	}
 	});
}