//弹出提示框
function showMsg(msg) {
    var dialog = $("<div class='alert alert-warning alert-dismissible navbar-fixed-top' role='alert'>"
           + "<button type='button' class='close' data-dismiss='alert'><span aria-hidden='true'>&times;</span><span class='sr-only'>Close</span></button>"
            + "<strong>" + msg + "</strong>"
               + "</div>");
    dialog.appendTo("body");

    setTimeout(function () {
        dialog.hide();
    }, 3000);
};
