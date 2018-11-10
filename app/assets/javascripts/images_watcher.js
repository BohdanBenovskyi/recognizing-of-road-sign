$(document).ready(function() {
    console.log("ready!");
    var interval = 1000;
    function doAjax() {
        $.ajax({
            type: 'GET',
            contentType: "application/json",
            url: '/images/bin',
            success: function (data) {
                $("#bin-image").attr("src", data);
                console.log('Success ----> ' + data);
            },
            complete: function (data) {
                setTimeout(doAjax, interval);
            }
        });
    }
    setTimeout(doAjax, interval);
});