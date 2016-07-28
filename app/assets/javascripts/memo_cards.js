// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
 // You can use CoffeeScript in this file: http://coffeescript.org/
  var dbgMode = location.search.split('dbg_mode=')[1]

  $(document).on("click" ,".answer",function(){
      clicked_answer = $(this).text().trim()  //retrieve the clicked answer
      $.ajax({ type: 'GET',
          url: '1/check_answer',
          dataType: "json",
          data: {"word_temp": clicked_answer , "word_in_german": $("#question").text().trim(), "dbg_mode": dbgMode},
          error: function(){
             alert("something went wrong :/");
          },
          success: function(json) {
            success_click_from_user(json);
          }
       });
  });

  $(document).on("click" ,"#calculate",function(){
      $.ajax({ type: 'GET',
          url: '1/count_for_result' ,
          dataType: "json",
          data: { "dbg_mode": dbgMode},
          error: function(){
              alert("oops!");
          },
          success: function(json) {
              user_daily_info(json)
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

  var next_one = function(){
      self.location = httpUrl
  };

  function same_page(){
      location.reload()
  }

  var success_click_from_user = function(json) {
      // testers: function() {
      //   return "test";
      // }
      $("#theAnswerIs").html(clicked_answer + " is: " + json.answer)
      httpUrl = '/memo_cards/' + json.nextid
      if (json.answer == "true") {
        setTimeout(next_one, 2000 )
      }
      else {
        setTimeout(same_page, 2000 )
      }
  };

  function user_daily_info(json) {
      $("#results").html("Today you have: Right answers: " + json.right_answers + " Wrong answers: " + json.wrong_answers)
      var int_right_result = json.right_answers;
      var int_wrong_result = json.wrong_answers;
      this.message_to_div;
      if (int_right_result == null && int_wrong_result == null) {
          message_to_div = "Error occured"
      }
      else if (int_right_result == 0 && int_wrong_result == 0) {
          message_to_div = "You havent replied any questions yet"
      }
      else if (+int_right_result > +int_wrong_result) {
          message_to_div = "Good KooshKoosh      " + "<img src='/assets/s3.png' />";
      }
      else {
          message_to_div = "Bad Kooshkoosh !     " + "<img src='/assets/s2.jpg' />"
      }
      this.therun = message_to_div;
      send_user_daily_data_to_html(message_to_div)
  }

  function send_user_daily_data_to_html(message)  {
    $("#calculate").html(message_to_div);
  }
