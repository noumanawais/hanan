
$(document).ready(function () {
	$("menu a").mousedown(function(){
		$(this).css("background-color" , "black");
	});

	$("menu a").mouseleave(function(){
		$("menu a").css("background-color" , "");
	});

	$("menu a").mouseup(function () {
	    $("menu a").css("background-color", "");
	});

	
	function validateEmail($email) {
	    var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
	    if (!emailReg.test($email)) {
	        return false;
	    } else {
	        return true;
	    }
	}


	$("#submit-join-form-main-page").click(function () {
	        
	    var match=true;
	        if ($("#firstName").val() == "") {

	            $("#f_name-error ").html("Please enter a first name.");
	            $("#error-global").removeClass("hidden");
	            $("#error-global div p").html("<b>Please correct the marked field(s) below.</b>");
	            match=false;
	        }
	         if ($("#lastName").val() == "") {
	            $("#l_name-error").html("Please enter a last name.");
	            $("#error-global").removeClass("hidden");
	            $("#error-global div p").html("<b>Please correct the marked field(s) below.</b>");
	            match = false;
	        }

	         if ($("#Email").val() == "") {
	             $("#e-error ").html("Please enter a valid email address");
	             $("#error-global").removeClass("hidden");
	             $("#error-global div p").html("<b>Please correct the marked field(s) below.</b>");
	             match = false;
	        
	         }
	         else
	         {
	             var use = $("#Email").val();
	             

	             if (use.length < 3) {
	                 $("#e-error ").html("The text you provided is too short (the minimum length is 3 characters, your text contains 2 characters).");
	                 $("#error-global").removeClass("hidden");
	                 $("#error-global div p").html("<b>Please correct the marked field(s) below.</b>");
	                 match = false;
	                 
	             }
	             else if (!validateEmail(use)) {
	                 $("#e-error ").html("Please enter a valid email address.");
                     $("#error-global").removeClass("hidden");
                     $("#error-global div p").html("<b>Please correct the marked field(s) below.</b>");
                
                 match = false;
             }
              
	             } 

	          
	         

	         if ($("#Pass").val() == "") {
	             $("#p-error ").html("Please enter a password.");
	             $("#error-global").removeClass("hidden");
	             $("#error-global div p").html("<b>Please correct the marked field(s) below.</b>");
	    
	             match = false;
	         }
	         else
	         {
	             var p = $("#Pass").val();
	         
	             if(p.length<6)
	             {
	                 $("#p-error ").html("The password you provided must have at least 6 characters.");
	                 $("#error-global").removeClass("hidden");
	                 $("#error-global div p").html("<b>Please correct the marked field(s) below.</b>");
	    
	                 match = false;
	             }	         
	         }

	         

	         
	         if (match == true)
	             return true;
	         else return false;
	   
	});


});

