$(document).ready(function() {
  $("button.up-down-vote-button").on("click", function(event) {
    event.preventDefault();
    var button = this

    var question_id = $(this).parent().attr("question")
    var answer_id = $(this).parent().attr("answer")
    var vote_type = $(this).attr("name")

    $.ajax({
      url: "/questions/" + question_id + "/answers/" + answer_id + "/vote",
      method: "POST",
      data: {question_id: question_id, answer_id: answer_id, vote_type: vote_type}
    })
    .done(function(response) {
      console.log(response)
      $(button).next().next().html(response)
      // change color of up arrow
    })
  })
});
