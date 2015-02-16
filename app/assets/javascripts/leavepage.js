var DeleteSnippetWidget = {}


DeleteSnippetWidget.autoDeleteIncompleteSnippet = function() {
  var submitNewContentExists = document.getElementById("submit_new_content")
  if(submitNewContentExists) {
    this.LeavePage();
  }
}

DeleteSnippetWidget.LeavePage = function() {

  var editSnippetExists = document.getElementsByClassName('edit_snippet');

  $('#submit_new_content').on('click', function() {
    window.btn_clicked = true;
  })

  window.onbeforeunload = function(event){
      if(!window.btn_clicked){
        // Need to add alert to prevent user from leaving page.
        if(editSnippetExists){
            var $url = $('.edit_snippet')[0].action;
            $.ajax({
              type: "DELETE",
              url: $url,
              dataType: "text"
            }).done(function(response){
              console.log("Success");
            });
        }
      }
  };
}
