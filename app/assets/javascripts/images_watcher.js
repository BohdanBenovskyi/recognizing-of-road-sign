$(document).ready(function() {
    sleep(5000);
    console.log("ready!");
    var interval = 250;

    function getBinImage() {
        $.ajax({
            type: 'GET',
            dataType: "json",
            url: '/images/bin',
            success: function (data) {
                $("#bin-image").attr("src", data);
            },
            error: function (request) {
                $("#bin-image").attr("src", request.responseText);
            },
            complete: function (data) {
                setTimeout(getBinImage, interval);
            }
        });
    }
    setTimeout(getBinImage, interval);

    function getClassifyImage() {
        $.ajax({
            type: 'GET',
            dataType: "json",
            url: '/images/classify',
            success: function (data) {
                $("#class-image").attr("src", data);
            },
            error: function (request) {
                $("#class-image").attr("src", request.responseText);
            },
            complete: function (data) {
                setTimeout(getClassifyImage, interval);
            }
        });
    }
    setTimeout(getClassifyImage, interval);
});

function sleep(milliseconds) {
    let start = new Date().getTime();
    for (var i = 0; i < 1e7; i++) {
        if ((new Date().getTime() - start) > milliseconds){
            break;
        }
    }
}