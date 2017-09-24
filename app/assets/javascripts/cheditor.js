$(document).ready(function(){
  CKEDITOR.config.height = 100;
});

jQuery(function() {
  return $('#search_search').autocomplete({
    source: $('#search_search').data('autocomplete-source')
  });
});
