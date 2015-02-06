// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
 // You can use CoffeeScript in this file: http://coffeescript.org/


$(document).on("click" ,".answer",function(){
    $.ajax({ type: 'GET',
        url: '1/ajax_try' ,
        dataType: "json",
        data: {"word_temp": $("#answer1").text().trim() , "word_in_german": $("#question").text().trim()},
        error: function(){
           alert("oops!");
        },
        success: function(json) {
            alert (json.answer)
        }
     });
});


