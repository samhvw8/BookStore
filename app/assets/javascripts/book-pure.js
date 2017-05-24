$(document).on('click', '#new-author-btn', function () {
	$('.author-form').after(get_author_form());
});

$(document).on('click', '#new-category-btn', function () {
	$('.category-form').after(get_category_form());
});

$(document).on('click', '#add-book-btn', function () {
    $('#add-book-form').submit();
});

function get_category_form() {
	var html = '<div class="form-group new-category-form">\
                <label class="control-label col-sm-2" for="author-name">New category:</label>\
                <div class="col-sm-10">\
                    <input type="text" id="category-name" class="form-control" name="category_name[]" placeholder="Title">\
                </div>\
            </div>';
    return html;
}

function get_author_form() {
	var html = '<div class="form-group new-author-form">\
                <label class="control-label col-sm-2" for="author-name">Author name:</label>\
                <div class="col-sm-10">\
                    <input type="text" id="author-name" class="form-control" name="author_name[]" placeholder="Title">\
                </div>\
            </div>\
            <div class="form-group new-author-form">\
                <label class="control-label col-sm-2" for="bio">Author bio:</label>\
                <div class="col-sm-10"> \
                    <textarea id="bio" name="bio[]" class="form-control"></textarea>\
                </div>\
            </div>';
    return html;
}