$(document).ready(function(){
  $(".search_form").submit(function(){
    var body = $("#form_field").val();

    if (body.length < 1) {
        alert('Please enter the name song of to search.');
        return false;
    }
  });
})