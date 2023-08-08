$(document).ready(function() {
  debugger
  $('#post-ajax').on('click', function() {
    var projectIds = $(this).val();
    $('#ajax1').empty();
    $.ajax({
      url: '/posts/' + postIds + '/post', 
      method: 'GET',
      dataType: 'html',
      data: { postid: postIds },
      success: function(response) {
        $("#ajax1").html(response);
      }
    });
  });
});