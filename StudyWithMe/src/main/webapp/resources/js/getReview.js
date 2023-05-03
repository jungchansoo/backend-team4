/**
 * 
 */
var reviewNo = $('#reviewNo').data('review-no');
var userId = $('#userId').data('user-Id');

const csrfTokenValue = $('#csrfToken').val();

var hasUpvoted;
var hasDownvoted;

$(document).ready(function () {
    var operForm = $("#operForm");
    $("button[data-oper='modify']").on("click", function (e) {
        operForm.attr("action", "/updateReview").submit();
    });
    hasUpvoted = '${hasUpvoted}' === 'true';
    hasDownvoted = '${hasDownvoted}' === 'true';
    updateUpvoteButton(hasUpvoted);
    updateDownvoteButton(hasDownvoted);
});
function updateUpvoteButton(hasUpvoted) {
    if (hasUpvoted) {
        $("#upvote-btn").removeClass("btn-light").addClass("btn-primary");
    } else {
        $("#upvote-btn").removeClass("btn-primary").addClass("btn-light");
    }
}

function updateDownvoteButton(hasDownvoted) {
    if (hasDownvoted) {
        $("#downvote-btn").removeClass("btn-light").addClass("btn-danger");
    } else {
        $("#downvote-btn").removeClass("btn-danger").addClass("btn-light");
    }
}


$(function () {
    $("#start-date").datepicker();
    $("#end-date").datepicker();
});

$(function () {
    $(".datepicker").datepicker({
        dateFormat: "yy-mm-dd"
    });
});

$(function () {
    $("#datepicker").datepicker({
        dateFormat: "yy-mm-dd",
        onSelect: function (dateText) {
            $("#selected-date").text("Selected date: " + dateText);
        }
    });

    $("#datepicker-trigger").click(function () {
        $("#datepicker").datepicker("show");
    });
});

function confirmDelete() {
    // 모달창 띄우기
    $('#deleteModal').modal('show');
}

function deleteReview() {
    // Review 삭제 요청을 보내는 AJAX 요청 코드
    $.ajax({
        url: '/deleteReview',
        type: 'POST',
        headers: {
            'X-CSRF-TOKEN': csrfTokenValue
        },
        data: {
            reviewNo: '${board.reviewNo}'
        },
        success: function (result) {
            window.location.href = '/reviewlist';
        },
        error: function (xhr, status, error) {
            alert('삭제에 실패하였습니다.');
        }
    });
}

$(document).on("click", "button.btn-danger delete", function () {
    confirmDelete();
});

$(document).on("click", "button#delete-confirm-button", function () {
    deleteReview();
});

// 좋아요 버튼 클릭 이벤트

$("#upvote-btn").on("click", function () {
    console.log("reviewNo: " + reviewNo);
    var action = hasUpvoted ? "cancelUpvote" : "upvoteReview";
    console.log('userId:' +userId);

    $.ajax({
        type: "POST",
        url: "/" + +action,
        headers: {
            'X-CSRF-TOKEN': csrfTokenValue
        },
        data: {
            userId: userId,
            reviewNo: reviewNo,
            action: 'upvote'
        }
    }).done(function (data) {
        if (data === "success") {
            console.log("Upvote success!");
            var currentUpvotes = parseInt($("#upvote-count").text(), 10);
            if (action === "upvoteReview") {
                $("#upvote-count").text(currentUpvotes + 1);
            } else {
                $("#upvote-count").text(currentUpvotes - 1);
            }
            hasUpvoted = !hasUpvoted;
            updateUpvoteButton(hasUpvoted);
        } else {
            console.log("Upvote failed. Data: " + data);
        }
    }).fail(function (jqXHR, textStatus, errorThrown) {
        console.log("Upvote AJAX request failed. Status: " + textStatus + ", Error: " + errorThrown);
        console.log("Response: " + JSON.stringify(jqXHR));
    });
});


// 싫어요 버튼 클릭 이벤트
$("#downvote-btn").on("click", function () {
    console.log("reviewNo: " + reviewNo);
    var action = hasUpvoted ? "cancelDownvote" : "downvoteReview";
    console.log('userId:' +userId);

    $.ajax({
        type: "POST",
        url: "/" + action,
        headers: {
            'X-CSRF-TOKEN': csrfTokenValue
        },
        data: {
            userId: userId,
            reviewNo: reviewNo,
            action: 'downvote'
            }
    }).done(function (data) {
        if (data === "success") {
            console.log("Downvote success!");
            var currentDownvotes = parseInt($("#downvote-count").text(), 10);
            if (action === "downvoteReview") {
                $("#downvote-count").text(currentDownvotes + 1);
            } else {
                $("#downvote-count").text(currentDownvotes - 1);
            }
            hasDownvoted = !hasDownvoted;
            updateVoteButtonStatus();
        } else {
            console.log("Downvote failed. Data: " + data);
        }
    }).fail(function (jqXHR, textStatus, errorThrown) {
        console.log("Upvote AJAX request failed. Status: " + textStatus + ", Error: " + errorThrown);
        console.log("Response: " + JSON.stringify(jqXHR));
    });
});

