// $(document).ready(function(){
//   // Cart remove button
//   $('table.table').on('click', 'a.remove-button', removeItem);
// });


// var removeItem = function(event) {
//   event.preventDefault();
//   $removeButton = $(this);
//   console.log("stop!");
//   var route = $removeButton.attr('href');
//   debugger;

//   var request = $.ajax({
//     url: route,
//     method: 'delete'
//   })

//   request.done(function(response){
//     console.log(response);
//     $('td.remove-button').parent().remove();
//   })

//   request.fail(function(response){
//     console.log("FAILED!")
//   })
// }
