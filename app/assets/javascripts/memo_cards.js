// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
 // You can use CoffeeScript in this file: http://coffeescript.org/


$(document).on("click" ,".answer",function(){

    clicked_answer = $(this).text().trim()  //retrieve the clicked answer
    $.ajax({ type: 'GET',
        url: '1/check_answer' ,
        dataType: "json",
        data: {"word_temp": clicked_answer , "word_in_german": $("#question").text().trim()},
        error: function(){
           alert("oops!");
        },
        success: function(json) {
            alert (clicked_answer + " is: " + json.answer)
            var nextid =json.nextid
            httpUrl = '/memo_cards/' + nextid
            if (json.answer == "true")
             self.location=httpUrl
        }
     });
});

