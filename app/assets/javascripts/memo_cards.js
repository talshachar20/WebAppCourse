// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
 // You can use CoffeeScript in this file: http://coffeescript.org/


$(document).on("click" ,"#answer1",function(){
    $.ajax({ type: 'GET',
        url: '4/ajax_try' ,
        dataType: "json",
        data: {"word": $("#answer1").text() , 'id_of_word': '1' },
        error: function(){
           alert("oops!");
        },
        success: function(json) {
            alert (json.answer)
        }
     });
});


