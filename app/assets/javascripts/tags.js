$(document).ready(function() {

  $('.tag-remove').click(function(event) {
    event.preventDefault();
    $(this).parent().remove();
  });

  $('ul.tags').click(function() {
    $('#search-field').focus();
  });

  $('#search-field').keyup(function(event) {
    if (event.which == '188') {
      if (($(this).val() != '') && ($(".tags .added-tag:contains('" + $(this).val() + "') ").length == 0 )){
        $('<li class="added-tag">'+ $(this).val().slice(0, -1)+
          '<span class="tag-remove" onclick="$(this).parent().remove();"> '+
          '<i class="fa fa-window-close" aria-hidden="true"></i>'+
          '</span><input type="hidden" value="'+
          $(this).val().slice(0, -1) + '" name="tags[]"></li>')
          .insertBefore('.tags .tag-add');
        $(this).val('');
      }
      else {
        $(this).val('');
      }
    }
  });
});
