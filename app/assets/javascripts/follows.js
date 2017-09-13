$(document).ready(function() {
  $('body').on('click', '.btn-follow', function(e){
    var url = $(this).attr('href');
    var method = $(this).data('method');
    $.ajax({
      url: url,
      method: method,
      dataType: 'JSON'
    })
    .done(function(data) {
      if (data)
        $('.follow').html(data.form_follow)
      else
        alert(I18n.t("follow.errors"));
    })

    return false;
  });
});
