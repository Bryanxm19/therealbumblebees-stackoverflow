$(document).ready(function() {
  $("button.up-down-vote-button").on("click", function(event) {
    event.preventDefault();

    question_id = $(this).parent().attr("action").slice(11, 12)
    answer_id = $(this).parent().attr("action").slice(21, 22)

    // $.ajax({
    //   url: "/questions/:question_id/answers/:answer_id/vote",
    //   method: "POST",
    //
    // })
  })
});
