$(document).ready(function() {
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
});

