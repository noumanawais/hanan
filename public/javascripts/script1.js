$(document).ready(function () {
    $("#submit-reset-request").click(function () {
        var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
        if ($("#emailtoget").val() == "" || !emailReg.test($("#emailtoget").val())) {
            $("#error-box").removeClass("hidden");
            $("#error-box div p").html("<b>Please correct the marked field(s) below.</b>");
            if ($("#emailtoget").val() == "")
                $("#emailErrors").html("Please enter a value.");
            else $("#emailErrors").html("Please enter a valid email address.");
            return false;
        }
        else return true;
    });
});


