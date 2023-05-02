/**
 * 
 */
var reviewNo = $('#reviewNo').data('review-no');
const csrfTokenValue = $('#csrfToken').val();
$(document).ready(function () {
    var operForm = $("#operForm");
    $("button[data-oper='modify']").on("click", function (e) {
        operForm.attr("action", "/updateReview").submit();
    });
});

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

    $.ajax({
        type: "POST",
        url: "/upvoteReview",
        headers: {
            'X-CSRF-TOKEN': csrfTokenValue
        },
        data: { reviewNo: reviewNo }
    }).done(function (data) {
        if (data === "success") {
            console.log("Upvote success!");
            var currentUpvotes = parseInt($("#upvote-count").text(), 10);
            $("#upvote-count").text(currentUpvotes + 1);
            } else {
            console.log("Upvote failed. Data: " + data);
        }
    }).fail(function(jqXHR, textStatus, errorThrown) {
        console.log("Upvote AJAX request failed. Status: " + textStatus + ", Error: " + errorThrown);
        console.log("Response: " + JSON.stringify(jqXHR));
    });
});


// 싫어요 버튼 클릭 이벤트
$("#downvote-btn").on("click", function () {
    console.log("reviewNo: " + reviewNo);
    
    $.ajax({
        type: "POST",
        url: "/downvoteReview",
        headers: {
            'X-CSRF-TOKEN': csrfTokenValue
        },
        data: { reviewNo: reviewNo }
    }).done(function (data) {
        if (data === "success") {
            console.log("Downvote success!");
            var currentDownvotes = parseInt($("#downvote-count").text(), 10);
            $("#downvote-count").text(currentDownvotes + 1);
            } else {
            console.log("Downvote failed. Data: " + data);
        }
    }).fail(function(jqXHR, textStatus, errorThrown) {
        console.log("Upvote AJAX request failed. Status: " + textStatus + ", Error: " + errorThrown);
        console.log("Response: " + JSON.stringify(jqXHR));
    });
});

