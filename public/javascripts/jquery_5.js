$(document).ready(function () {

    function validateEmail($email) {
        var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
        if (!emailReg.test($email)) {
            return false;
        } else {
            return true;
        }
    }


  
    $("#submit-Signin").click(function () {
    
        var op = true;

       
        if($("#e-field").val()=="")
        {
            $("#email_err").html("Please enter a value.");
            $(".error-message-box p").html("There were one or more errors in your submission. Please correct the marked fields below.");   
            match = false;
        }
        else {
            var use = $("#e-field").val();


            if (use.length < 3) {
                $("#email_err").html("The text you provided is too short (the minimum length is 3 characters, your text contains 2 characters).");
                $("#e-box").removeClass("hidden");
                $(".error-message-box p").html("<b>There were one or more errors in your submission. Please correct the marked fields below.</b>");
                match = false;

            }
            else if (!validateEmail(use)) {
                $("#email_err").html("Please enter a valid email address.");
                $("#e-box").removeClass("hidden");
                $(".error-message-box p").html("<b>There were one or more errors in your submission. Please correct the marked fields below.</b>");
               
                match = false;
            }

        }




        if ($("#p-field").val() == "")
        {
            $("#pass_err").html("Please enter a value.");
            $("#e-box").removeClass("hidden");
            $(".error-message-box p").html("<b>There were one or more errors in your submission. Please correct the marked fields below.</b>");
            match = false;
        
            op = false;
        }
        else {
            var p = $("#p-field").val();

            if (p.length < 6) {
                $("#pass_err").html("The password you provided must have at least 6 characters.");
                $("#e-box").removeClass("hidden");
                $(".error-message-box p").html("<b>Please correct the marked field(s) below.</b>");

                match = false;
            }
        }


        if (op == true)
            return true;
        else return false;

    
    });

});