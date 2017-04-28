$(document).ready(function() {
  $("button.up-down-vote-button").on("click", function(event) {
    event.preventDefault();
    button = this

    question_id = $(this).parent().attr("action").slice(11, 12)
    answer_id = $(this).parent().attr("action").slice(21, 22)
    vote_type = $(this).attr("name")

    $.ajax({
      url: "/questions/" + question_id + "/answers/" + answer_id + "/vote",
      method: "POST",
      data: {question_id: question_id, answer_id: answer_id, vote_type: vote_type}
    })
    .done(function(response) {
      $(button).next().next().html(response)
    })
  })
});
