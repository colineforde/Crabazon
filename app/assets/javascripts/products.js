$(document).ready(function() {
	createCategorySelectorBox();
	addItemToCartSelector();
});


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