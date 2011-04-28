$(document).ready(function() {
  $('.delete_hotel').bind('ajax:success', function() {
    var li = $(this).closest('li');
    li.fadeOut('slow', function() { li.remove(); });
  });
});
