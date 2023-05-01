/**
 * 
 */
$(document).ready(
    function () {
        history.replaceState({}, null, null);
        var searchForm = $("#searchForm");
        $("#searchForm button").on("click",
            function (e) {
                if (!searchForm.find(
                    "input[name='keyword']").val()) {
                        alert("키워드를 입력하세요");
                    return false;
                }
                searchForm.find("input[name='pageNum']").val("1");
                e.preventDefault();
                searchForm.submit();
            });

        var actionForm = $("#actionForm");

        $(".paginate_button.previous a").on("click",
            function (e) {
                e.preventDefault();
                var page = parseInt(actionForm.find("input[name='pageNum']").val());
                if (page > 1) {
                    actionForm.find("input[name='pageNum']").val(page - 1);
                    actionForm.submit();
                }
            });

        $(".paginate_button.next a")
            .on(
                "click",
                function (e) {
                    e.preventDefault();
                    var page = parseInt(actionForm.find("input[name='pageNum']").val());
                    var lastPage = parseInt("${pageMaker.endPage}");
                    if (page < lastPage) {
                        actionForm.find("input[name='pageNum']").val(page + 1);
                        actionForm.submit();
                    }
                });

        $(".paginate_button:not(.previous, .next) a").on("click",
            function (e) {
                e.preventDefault();
                actionForm.find("input[name='pageNum']").val($(this).attr("href"));
                actionForm.submit();
            });
        $(".move").on("click",
            function (e) {
                e.preventDefault();
                actionForm.append("<input type='hidden' name='reviewNo' value='" + $(this).attr("href") + "'>");
                actionForm.attr("action", "/getReview");
                actionForm.submit();
            });

    });