$(document).ready(function() {
  // Upvote Button for answer
  $("body").on("click", "button.up-button", function(event) {
    event.preventDefault();
    var button = this

    var question_id = $(this).parent().attr("question")
    var answer_id = $(this).parent().attr("answer")
    var vote_type = $(this).attr("name")

    if (!$(button).hasClass("voted")) {
      // odd clicks
      if (!$(button).next().next().next().next().hasClass("voted")) {
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
        // $(button).removeClass("voted")
      })
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
    }
  });

  // Downvote Button for answer
  $("body").on("click", "button.down-button", function(event) {
    event.preventDefault();
    var button = this

    var question_id = $(this).parent().attr("question")
    var answer_id = $(this).parent().attr("answer")
    var vote_type = $(this).attr("name")
    var opposite_vote_type = $(this).attr("opposite")

    if (!$(button).hasClass("voted")) {
      // odd click
      if (!$(button).prev().prev().prev().prev().hasClass("voted")) {
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
        // $(button).removeClass("voted")
      })
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
    }
  });

  // Upvote Button for question
  $("body").on("click", "button.up-button-question", function(event) {
    event.preventDefault();
    var button = this

    var question_id = $(this).parent().attr("question")
    var vote_type = $(this).attr("name")

    if (!$(button).hasClass("voted")) {
      // odd clicks
      if (!$(button).next().next().next().next().hasClass("voted")) {
        // if up click is not pressed and down click is not pressed, create one upvote
        request = $.ajax({
          url: "/questions/" + question_id + "/vote",
          method: "POST",
          data: {question_id: question_id, vote_type: vote_type}
        })
      } else {
        // if up click is not pressed and down click is pressed, create two upvotes
        request = $.ajax({
        url: "/questions/" + question_id + "/vote_twice",
        method: "POST",
        data: {question_id: question_id, vote_type: vote_type}
        })
      }

      request.done(function(response) {
        $(button).next().next().html(response)
        $(button).css("color", "darkorange")
        $(button).addClass("voted")
        $(button).next().next().next().next().css("color", "dimgrey")
        // $(button).removeClass("voted")
      })
    } else {
      // even clicks
      // if up click is already pressed, undo the upvote (destroy the vote)
      $.ajax({
        url: "/questions/" + question_id + "/unvote",
        method: "POST",
        data: {question_id: question_id}
      })
      .done(function(response) {
        $(button).next().next().html(response)
        $(button).css("color", "dimgrey")
        $(button).removeClass("voted")
      })
    }
  });

  // Downvote Button for question
  $("body").on("click", "button.down-button-question", function(event) {
    event.preventDefault();
    var button = this

    var question_id = $(this).parent().attr("question")
    var vote_type = $(this).attr("name")
    var opposite_vote_type = $(this).attr("opposite")

    if (!$(button).hasClass("voted")) {
      // odd click
      if (!$(button).prev().prev().prev().prev().hasClass("voted")) {
        // if down click is not pressed and up click is not pressed, create one downvote
         request = $.ajax({
          url: "/questions/" + question_id + "/vote",
          method: "POST",
          data: {question_id: question_id, vote_type: vote_type}
        })
      } else {
        // if down click is not pressed and up click is pressed, create two downvotes
          request = $.ajax({
          url: "/questions/" + question_id + "/vote_twice",
          method: "POST",
          data: {question_id: question_id, vote_type: vote_type}
        })
      }

      request.done(function(response) {
        $(button).prev().prev().html(response)
        $(button).css("color", "darkred")
        $(button).addClass("voted")
        $(button).prev().prev().prev().prev().css("color", "dimgrey")
        // $(button).removeClass("voted")
      })
    } else {
      // even click
      // if down click is already pressed, undo the downvote (destroy the vote)
      $.ajax({
        url: "/questions/" + question_id + "/unvote",
        method: "POST",
        data: {question_id: question_id}
      })
      .done(function(response) {
        $(button).prev().prev().html(response)
        $(button).css("color", "dimgrey")
        $(button).removeClass("voted")
      })
    }
  });

  // Creating a new answer
  $(".question-answer-container").on("submit", "#new-answer", function(event) {
    event.preventDefault();

    var data = $(this).serialize();
    var url = $(this).attr("action");

    $.ajax({
      method: "POST",
      url: url,
      data: data
    })
    .done(function(response) {
      $("#answer").empty().append(response);
      $("#new-answer").trigger('reset');
    })
  });

  // Deleting an answer
  $("body").on("submit", ".delete-answer", function(event) {
    event.preventDefault();

    var url = $(this).attr("action");
    var id = $(this).attr("id");

    $.ajax({
      type: "delete",
      url: url,
      data: {id: id}
    })
    .done(function(response) {
      $("#"+response.answer_id).parent().parent().remove();
    })
  })
});
