$(document).ready(function(){
  $('body').on('click', '.delete-post', function(e){
    var post_id = $(this).data('post-id');
    if (confirm(I18n.t("comments.confirm"))) {
      $.ajax({
        url: '/posts/' + post_id,
        dataType: 'JSON',
        method: "DELETE",
        data: {post_id: post_id}
      })
      .done(function(data) {
        $(".fade-out-post-"+ post_id).fadeOut(200);
      });
    }
  });
});
