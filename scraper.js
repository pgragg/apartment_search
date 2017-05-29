var jq = document.createElement('script');
jq.src = "https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js";
document.getElementsByTagName('head')[0].appendChild(jq);
// ... give time for script to load, then type (or see below for non wait option)
jQuery.noConflict();

// jQuery.ajax({
//     type: "POST",
//     url: "http://127.0.0.1:3000/ingest",
//     data: {'html': jQuery("html").html()},
//     success: function(response) {
        
//     }
// });


var uri = "http://127.0.0.1:3000/ingest";
$.ajax({
		type: "POST",
    url: uri,
    data: {'html': jQuery("html").html()},
    beforeSend: function (request) {
        request.setRequestHeader("Authorization", "Negotiate");
    },
    async: true,
    success: function (data) {
        alert(JSON.stringify(data));
    },
    error: function (xhr, textStatus, errorMessage) {
        alert(errorMessage);
    }                
});