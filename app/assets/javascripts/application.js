// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require js-routes
//= require ckeditor/ckeditor
//= require ckeditor/config
//= require bootstrap-modal
//= require bootstrap-modalmanager
//= require standards_pdf

$(document).on("change", "#standard_parent_id", function () {
    var select = $("#standard_number"),
        i,
        parent_select =$(this),
        selected_parent_id = parent_select.val(),
        native_parent_id = parent_select.find('option[selected="selected"]').val();
    //FIXME!!! Данный подход не очень хорош в силу того, что нужно хранить родной номер где-то в скрытом диве на странице.
    if (native_parent_id === selected_parent_id)
        var native_number = $("#native_number").text();

    $.get(Routes.numbers_api_standard_path(selected_parent_id, {native_number: native_number}),function (data) {
        select.find('option').remove();
        for (i in data)
            select.append('<option value=' + data[i] + '>' + data[i] + '</option>');
    }, 'json').error(function () {
            alert("error!");
        });
});

$(function () {
    $("#q_reset").click(function () {
        $("#q_state_cont, #q_access_state_cont").val("");
    });
});
