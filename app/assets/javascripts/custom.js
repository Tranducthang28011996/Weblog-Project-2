$(document).ready(function(){
  (function() {
    "use strict";
    if (window.location && window.location.hash) {
      if (window.location.hash === '#_=_') {
        window.location.hash = '';
        history.pushState('', document.title, window.location.pathname);
      }
    }
  }());
});
