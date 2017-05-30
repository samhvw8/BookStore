$(document).on('turbolinks:load', function () {

    var url = $($('.subscribe-notification')[0]).data('url');

    $.ajax({
        type: "GET",
        url: url,
        dataType: "JSON",
        success: function(data) {
            if (data.have_notification) {
                $('.subscribe-notification').addClass('have-notification').text('!');
            } else {
                $('.subscribe-notification').removeClass('have-notification').text('');
            }
        }
    });

});