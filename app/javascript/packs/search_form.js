$(document).ready(function(){
  $(".search_form").submit(function(){
    var body = $("#form_field").val();

    if (body.length < 1) {
      alert('Please enter the name song of to search.');
      return false;
    }
  });

  $("#form_field").autocomplete({
    source: function(request, response) {
      $.ajax({
        url: "music/auto_complete",
        type: "GET",
        dataType: "json",
        data: {
          track: request.term
        },
        success: function(data) {
            response($.map(data, function(value, key){
            return {
                label: value['term'],
                value: key
            };
          }));
        },
        error: function(){
          alert("Something went wrong...")
        }
      });
    },
  });
})
