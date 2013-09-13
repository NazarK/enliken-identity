$(function () {
  $(window).bind('hashchange', processHash);
  
  function processHash() {
    console&&console.log('hash change detected to ' + location.hash);
  	$(".auth-method-button").removeClass("active");
  	
  	if (location.hash) {
  		$("a[href=" + location.hash + "] .auth-method-button").addClass("active");
  		$(".auth-protocol-box > div").hide();
  		$(".auth-protocol-box > #" + location.hash.slice(1)).css('display','block');
  	}
  }
  processHash()
  
  $("form").submit(function() {
	console&&console.log("form submit")
    console&&console.log(location.hash)

    console&&console.log($(this).parent());
    console&&console.log($(this).parent().siblings());
    console&&console.log($(this).parent().attr('class'));


	if(location.hash=="#email") {
		var email = $("input[type=email]").val()
		console&&console.log(email)
		$.get("/auth/email_submit",{email:email},function(resp) {
			console&&console.log(resp)
		})
	}
    
    if ($(this).parent().hasClass("step-two")) { 
      
      // DO SOME VERIFICATION FOR PIN OR ANSWERS HERE
      // SERVE LINK TO DASHBOARD HERE FOR PIN/QUESTION
      
      return false;
    }
    
    $(this).parent().hide();
    $(this).parent().siblings('.step-two').show();
    
    $("a#step-back").click(function () {
      console&&console.log("step back click detected.");
      console&&console.log("trying to show step-one:");
      console&&console.log($(this).siblings(".step-one"));
      
      $(this).parent().hide();
      $(this).parent().siblings(".step-one").show();
      return false;
    });
    
    // DO SOMETHING WITH THE FORM DATA HERE
    // SEND EMAIL/MAKE PHONE CALL ETC
    
    return false;
  });
})


