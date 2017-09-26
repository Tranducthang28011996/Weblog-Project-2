$(document).ready(function(){
  $('body').on('click', '.cancel-comment', function() {
    var comment = $(this).parents('#reply_comment').find('input').val();
    $(this).parents('#reply_comment').html(comment + '<span class="reply_comment">' +
      '<i class="fa fa-pencil-square-o icon-comment" aria-hidden="true">' + '</i></span>');
  });

  $('body').on('click', '.update-comment', function() {
    var comment_id = $(this).closest('.list-group-item').data('comment-reply');
    var comment = $(this).parents('#reply_comment').find('input').val();
    var url = '/comments/' + comment_id ;
    $(this).parents('#reply_comment').html(comment +
      '<span class="reply_comment">' +
      '<i class="fa fa-pencil-square-o icon-comment" aria-hidden="true">' + '</i></span>');
    if (confirm(I18n.t("comments.confirm"))) {
      $.ajax({
        url: url,
        type: 'PATCH',
        data: {
          comment: comment,
          comment_id: comment_id,
        },success: function(result) {
          if (result.status)
            alert(I18n.t("comments.update"));
          else
            alert(I18n.t("comments.not_update"));
        }
      });
    }
  });

  $('body').on('click', '.reply_comment', function() {
    var reply_comment_id = $(this).closest('.list-group-item').data('comment-reply');
    var value = $(this).closest('#reply_comment').text();
    $(this).parents("#reply_comment").html("<input type='text' value="+ value +
      "><button class='update-comment'>" +
      I18n.t("comments.update") + "</buton><button class='cancel-comment'>" +
      I18n.t("comments.cancel") + "</buton>");
  });

  $('body').on('click', '.reply_comment_post', function() {
    var value = $(this).closest('#reply_comment_post').text();
    $(this).parents("#reply_comment_post").html("<input type='text' value=" + value +
      "><button id='update-comment'>" + I18n.t("comments.update") + "</buton>" +
      "<button id='cancel-comment'>" + I18n.t("comments.cancel") + "</buton>");
  });

  $('body').on('click', '#cancel-comment', function() {
    var comment = $(this).parents('#reply_comment_post').find('input').val();
    var comment_id = $(this).closest('.list-group-item').data('comment-post');
    $(this).parents('#reply_comment_post').html(comment + '<span class="reply_comment_post">' +
      '<i class="fa fa-pencil-square-o icon-comment" aria-hidden="true">'+
      '</i></span>' + '<a href="#reply-' + comment_id + '" data-toggle="collapse"> ' +
      I18n.t("comments.reply") + '</a>');
  });

  $('body').on('click', '#update-comment', function() {
    var post_id = $(this).closest('.list-group-item').data('comment-post');
    var comment = $(this).parents('#reply_comment_post').find('input').val();
    var comment_id = $(this).closest('.list-group-item').data('comment-post');
    var url = '/comments/' + post_id ;
    $(this).parents('#reply_comment_post').html(comment + '<span class="reply_comment_post">' +
      '<i class="fa fa-pencil-square-o icon-comment" aria-hidden="true">'+
      '</i></span>' + '<a href="#reply-' + comment_id + '" data-toggle="collapse">' +
      I18n.t("comments.reply") + '</a>');
    if (confirm(I18n.t("comments.confirm"))) {
      $.ajax({
        url: url,
        type: 'PATCH',
        dataType: 'JSON',
        data: {
          comment: comment,
          comment_id: post_id,
        },success: function(result) {
          if (result.status)
            alert(I18n.t("comments.update"));
          else
            alert(I18n.t("comments.not_update"));
        }
      });
    }
  });

  $('body').on('click', '.delete-comment-post', function() {
    var post_id = $(this).closest('.list-group-item').data('comment-post');
    var url = '/comments/' + post_id;
    if (confirm(I18n.t("comments.confirm"))) {
      $.ajax({
        url: url,
        type: 'DELETE',
        dataType: 'JSON',
        data: {
          comment_id: post_id,
        },success: function(result) {
          if (result.status){
            alert(I18n.t("comments.update"));
            $('#list-group-item-' + post_id.toString()).fadeOut();
          }
          else
            alert(I18n.t("comments.not_update"));
        }
      });
    }
  });

  $('body').on('click', '.delete-comment-reply', function() {
    var post_id = $(this).closest('.list-group-item').data('comment-reply');
    var url = '/comments/' + post_id;
    if (confirm(I18n.t("comments.confirm"))) {
      $.ajax({
        url: url,
        type: 'DELETE',
        dataType: 'JSON',
        data: {
          comment_id: post_id,
        },success: function(result) {
          if (result.status){
            alert(I18n.t("comments.update"));
            $('#list-group-item-' + post_id.toString()).fadeOut();
          }
          else
            alert(I18n.t("comments.not_update"));
        }
      });
    }
  });
});
