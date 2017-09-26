$(document).ready(function(){
  $('body').on('click', '.send-message', function() {
    var txt_mess = $(this).parents('.new_comment')
      .find('.form-add-comment');
    var url = $(this).parents('.new_comment').attr('action');
    $.ajax({
      url: url,
      type: 'POST',
      dataType: 'JSON',
      data: {
        comment: {
          content: txt_mess.val()
        }
      },
    })
    .done(function(result) {
      if (result.post_id == result.comment_id){
        $('.list-comments').append(result.html);
        txt_mess.val('');
        txt_mess.focus();
      }
      else{
        comment_class = '.reply-comment-post-'+result.post_id.toString();
        $(comment_class).append(result.html);
        txt_mess.val('');
        txt_mess.focus();
      }
    });
    return false;
  });
});
