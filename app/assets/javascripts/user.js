$(document).ready(function() {
    $('.delete-buttons').on('click', function(e) {
        e.preventDefault();
        var deleteButton = $(this);
        var confirmMessage = deleteButton.data('confirm');
        //   var url = deleteButton.attr();
        //   var confirmMessage = deleteButton.data('confirm');
        if (confirm(confirmMessage)) {
            var form = deleteButton.attr('form');
            var url=this.dataset.url;
            // debugger
            $.ajax({
            url: url,
            method: 'DELETE',
            dataType: 'json',
            success: function() {
            deleteButton.closest('tr').remove();
            deleteButton.closest(function(){
            $(this).remove();
            })
          },
            error: function() {
            alert('An error occurred while deleting the post.!!');
          }
        });
      }
    });
  });