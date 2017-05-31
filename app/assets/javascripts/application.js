// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require turbolinks
//= require_tree .


$(document).on('click', '.clickable-row', function () {
    var link = $(this).data('link');
    Turbolinks.visit(link);
});

$(document).ready(function () {
    $('#new_author').on('ajax:success', function (e, data, status, xhr) {
        if (data.hasOwnProperty('id')) {
            // success
            $('#add-author-modal').modal('hide');
            $('#new_author')[0].reset();
            $('.error-container').html('');
            var html = '<div class="col-xs-3"><input type="checkbox" name="authors[]" value="' +
                data.id + '" checked>' + data.name +'</div>';
            $('#add-author-btn').before(html);
        } else {
            // fail
            for (var property in data) {
                if (data.hasOwnProperty(property)) {
                    $('#add-author-modal .error-container').append(property + ' ' + data[property] + '<br>' );
                }
            }
        }
    }).on('ajax:error', function (e, xhr, status, error) {


        $('#add-author-modal .error-container').html("Network error!");
    });

    $('#new_category').on('ajax:success', function (e, data, status, xhr) {
        if (data.hasOwnProperty('id')) {
            // success
            $('#add-category-modal').modal('hide');
            $('#new_category')[0].reset();
            $('.error-container').html('');
            var html = '<div class="col-xs-3"><input type="checkbox" name="categories[]" value="' +
                data.id + '" checked>' + data.title +'</div>';
            $('#add-category-btn').before(html);
        } else {
            // fail
            for (var property in data) {
                if (data.hasOwnProperty(property)) {
                    $('#add-author-modal .error-container').append(property + ' ' + data[property] + '<br>' );
                }
            }
        }
    }).on('ajax:error', function (e, xhr, status, error) {
        $('#add-category-modal .error-container').html("Network error!");
    });
});

$(document).on('click', '.show-list', function () {
    $('.readings').addClass('list-mode');
});

$(document).on('click', '.hide-list', function () {
    $('.readings').removeClass('list-mode');
});

