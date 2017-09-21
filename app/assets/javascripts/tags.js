$(document).ready(function() {

  $('.tagRemove').click(function(event) {
    event.preventDefault();
    $(this).parent().remove();
  });

  $('ul.tags').click(function() {
    $('#search-field').focus();
  });

  $('#search-field').keyup(function(event) {
      if (event.which == '188') {
        if (($(this).val() != '') && ($(".tags .addedTag:contains('" + $(this).val() + "') ").length == 0 )){
          $('<li class="addedTag">' + $(this).val().slice(0, -1) + '<span class="tagRemove" onclick="$(this).parent().remove();"><i class="fa fa-window-close" aria-hidden="true"></i></span><input type="hidden" value="' + $(this).val().slice(0, -1) + '" name="tags[]"></li>').insertBefore('.tags .tagAdd');
          $(this).val('');
        }
        else {
          $(this).val('');
        }
      }
  });
});
