var up_click = false;
var down_click = false;

$(document).ready(function() {
  // Upvote Button
  $("button.up-button").on("click", function(event) {
    event.preventDefault();
    var button = this

    var question_id = $(this).parent().attr("question")
    var answer_id = $(this).parent().attr("answer")
    var vote_type = $(this).attr("name")

    if (up_click === false) {
      // odd clicks
      if (down_click === false) {
        // if up click is not pressed and down click is not pressed, create one upvote
        request = $.ajax({
          url: "/questions/" + question_id + "/answers/" + answer_id + "/vote",
          method: "POST",
          data: {question_id: question_id, answer_id: answer_id, vote_type: vote_type}
        })
      } else {
        // if up click is not pressed and down click is pressed, create two upvotes
        request = $.ajax({
        url: "/questions/" + question_id + "/answers/" + answer_id + "/vote_twice",
        method: "POST",
        data: {question_id: question_id, answer_id: answer_id, vote_type: vote_type}
        })
      }

      request.done(function(response) {
        $(button).next().next().html(response)
        $(button).css("color", "darkorange")
        $(button).addClass("voted")
        $(button).next().next().next().next().css("color", "dimgrey")
        $(button).removeClass("voted")
      })
      up_click = true;
    } else {
      // even clicks
      // if up click is already pressed, undo the upvote (destroy the vote)
      $.ajax({
        url: "/questions/" + question_id + "/answers/" + answer_id + "/unvote",
        method: "POST",
        data: {question_id: question_id, answer_id: answer_id}
      })
      .done(function(response) {
        $(button).next().next().html(response)
        $(button).css("color", "dimgrey")
        $(button).removeClass("voted")
      })
      up_click = false;
    }
  });

  // Downvote Button
  $("button.down-button").on("click", function(event) {
    event.preventDefault();
    var button = this

    var question_id = $(this).parent().attr("question")
    var answer_id = $(this).parent().attr("answer")
    var vote_type = $(this).attr("name")
    var opposite_vote_type = $(this).attr("opposite")

    if (down_click === false) {
      // odd click
      if (up_click === false) {
        // if down click is not pressed and up click is not pressed, create one downvote
         request = $.ajax({
          url: "/questions/" + question_id + "/answers/" + answer_id + "/vote",
          method: "POST",
          data: {question_id: question_id, answer_id: answer_id, vote_type: vote_type}
        })
      } else {
        // if down click is not pressed and up click is pressed, create two downvotes
          request = $.ajax({
          url: "/questions/" + question_id + "/answers/" + answer_id + "/vote_twice",
          method: "POST",
          data: {question_id: question_id, answer_id: answer_id, vote_type: vote_type}
        })
      }

      request.done(function(response) {
        $(button).prev().prev().html(response)
        $(button).css("color", "darkred")
        $(button).addClass("voted")
        $(button).prev().prev().prev().prev().css("color", "dimgrey")
        $(button).removeClass("voted")
      })
      down_click = true;
    } else {
      // even click
      // if down click is already pressed, undo the downvote (destroy the vote)
      $.ajax({
        url: "/questions/" + question_id + "/answers/" + answer_id + "/unvote",
        method: "POST",
        data: {question_id: question_id, answer_id: answer_id}
      })
      .done(function(response) {
        $(button).prev().prev().html(response)
        $(button).css("color", "dimgrey")
        $(button).removeClass("voted")
      })
      down_click = false;
    }
  });
});
