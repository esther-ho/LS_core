$(function() {
  // Submits the form only if the user selects OK
  $("form.delete").on('submit', function(event) {
    var ok = confirm("Are you sure? This cannot be undone!")
    return ok;
  });
});
