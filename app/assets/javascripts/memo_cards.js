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
            $("#theAnswerIs").html(clicked_answer + " is: " + json.answer )
            var nextid =json.nextid
            httpUrl = '/memo_cards/' + nextid
            if (json.answer == "true") {
                setTimeout(next_one, 3000 )
            }
        }
     });
});

$(document).on("click" ,"#calculate",function(){
    $.ajax({ type: 'GET',
        url: '1/count_for_result' ,
        dataType: "json",
        data: {},
        error: function(){
            alert("oops!");
        },
        success: function(json) {
            $("#results").html("Today you have: Right answers: " + json.right_answers + " Wrong answers: " + json.wrong_answers)
            if (json.right_answers > json.wrong_answers) {
                $("#calculate").html("Good KooshKoosh      " + "<img src='/assets/s3.png' />")
            }
            else {
                $("#calculate").html("Bad Kooshkoosh !     " + "<img src='/assets/s2.jpg' />")
            }
        }
    });
});

function sleep(milliseconds) {
    var start = new Date().getTime();
    for (var i = 0; i < 1e7; i++) {
        if ((new Date().getTime() - start) > milliseconds){
            break;
        }
    }
}

function next_one(){
    self.location = httpUrl
}






