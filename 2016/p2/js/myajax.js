//http://blog.teamtreehouse.com/create-ajax-contact-form
$(function () {
    // Get the form.
    var form = $('#ajax-contact');
    // Get the messages div.
    var formMessages = $('#form-messages');
    // TODO: The rest of the code will go here...
    $(form).submit(function (event) {
        // Stop the browser from submitting the form.
        event.preventDefault();
        // TODO
        // Serialize the form data.
        var formData = $(form).serialize();
        // Submit the form using AJAX.
        $.ajax({
            type: 'POST'
            , url: $(form).attr('action')
            , data: formData
        })
    });
});