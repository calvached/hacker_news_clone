$(document).ready(function() {
  $('#up-vote').on('click', function(){
    var post = document.getElementById('post-id').value;
    console.log(post);
    data = {vote: 1, postId: post};
    console.log(data);
    debugger;

    $.post('/upvote', data)

  });

});
