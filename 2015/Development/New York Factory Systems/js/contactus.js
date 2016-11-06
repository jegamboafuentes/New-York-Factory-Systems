 $(function() {
//twitter bootstrap script
 $("button#submit").click(function(){
         $.ajax({
     type: "POST",
 url: "contactus.php",
 data: $('form.contact').serialize(),
         success: function(msg){
                 $("#thanks").html(msg)
         },
 error: function(){
 alert("failure");
 }
       });
 });
});

